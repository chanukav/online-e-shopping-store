# AWS Deployment & CI/CD Guide for Online E-Shopping Store

## Overview
This project has been updated to support modern deployment using **Docker** and **Maven**. This guide outlines how to deploy the application to Amazon Web Services (AWS) using the Free Tier and set up a CI/CD pipeline with **Jenkins**.

## Architecture & Costs
To keep costs within your $100 budget (and mostly free if your account is within the first 12 months), we will use:
- **Compute**: AWS EC2 `t2.micro` or `t3.micro` (Free Tier eligible - 750 hours/month). We will run both Jenkins and the Dockerized app on this instance.
- **Database**: AWS RDS MySQL `db.t3.micro` or `db.t4g.micro` (Free Tier eligible - 750 hours/month).

> [!CAUTION]
> A `t2.micro` instance has 1GB of RAM. Jenkins and Java applications are memory-intensive. Setting up a swap file on the EC2 instance is **critical** to prevent the instance from freezing or crashing.

---

## Part 1: Setting up the Database (AWS RDS)

1. Go to the **AWS RDS Console**.
2. Click **Create database**.
3. Choose **Standard create** and select **MySQL**.
4. In the **Templates** section, select **Free tier** (this is very important to avoid costs).
5. **Settings**:
   - Provide a DB instance identifier (e.g., `eshop-db`).
   - Set the Master username (e.g., `admin`).
   - Set an Auto-generate password or provide a Master password. **Save this password**.
6. **Connectivity**:
   - Set **Public access** to **Yes** (if you want to access it from your local machine for testing) or **No** (safer, only EC2 can access). If No, make sure your EC2 instance and RDS are in the same VPC.
   - Expand **Additional configuration** and specify an **Initial database name** (e.g., `gamudalk`).
7. Click **Create database**. It will take a few minutes. Once active, note the **Endpoint** URL.

---

## Part 2: Launching the EC2 Instance

1. Go to the **AWS EC2 Console**.
2. Click **Launch instances**.
3. Name it (e.g., `Jenkins-Eshop-Server`).
4. **AMI**: Select **Ubuntu Server 22.04 LTS** (Free tier eligible).
5. **Instance type**: Select `t2.micro` or `t3.micro`.
6. **Key pair**: Create a new key pair (e.g., `eshop-key.pem`) and download it. You'll need it to SSH into the server.
7. **Network settings**:
   - Create a security group.
   - Allow **SSH traffic from Anywhere**.
   - Allow **HTTP traffic from Anywhere** (Port 80/8080).
   - Allow **Custom TCP** on port `8080` (for Tomcat and Jenkins).
8. Click **Launch instance**.

---

## Part 3: Server Configuration & Installation

SSH into your new EC2 instance using your terminal or Git Bash:
```bash
ssh -i "eshop-key.pem" ubuntu@<YOUR_EC2_PUBLIC_IP>
```

### 1. Create a Swap File (CRITICAL)
Since the `t2.micro` only has 1GB RAM, we need to add a 2GB swap file. Run these commands:
```bash
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

### 2. Install Java (OpenJDK 17)
```bash
sudo apt update
sudo apt install -y fontconfig openjdk-17-jre
```

### 3. Install Jenkins
```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
```

### 4. Install Docker
```bash
sudo apt install -y docker.io
sudo systemctl enable --now docker
# Add ubuntu and jenkins users to the docker group so they can run commands without sudo
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins
# Reboot the instance for group changes to take effect
sudo reboot
```

---

## Part 4: Jenkins Pipeline Configuration

1. After rebooting, go to `http://<YOUR_EC2_PUBLIC_IP>:8080` in your browser.
2. Get the initial admin password:
   ```bash
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```
3. Install suggested plugins and create your admin account.
4. **Create a Pipeline**:
   - Click **New Item** -> Name it `Eshop-Deploy` -> Select **Pipeline** -> OK.
5. **Configure GitHub Webhook** (Optional but recommended):
   - In your GitHub repo Settings -> Webhooks, add payload URL `http://<YOUR_EC2_PUBLIC_IP>:8080/github-webhook/`.
   - In Jenkins, under Build Triggers, check **GitHub hook trigger for GITScm polling**.
6. **Pipeline Script**:
   Scroll down to the Pipeline section and paste the following declarative pipeline script:

```groovy
pipeline {
    agent any

    environment {
        // Update these with your RDS Endpoint and Credentials
        DB_URL = 'jdbc:mysql://eshop-db.cr68guouud9p.ap-south-1.rds.amazonaws.com:3306/gamudalk?characterEncoding=utf8'
        DB_USER = 'admin'
        DB_PASSWORD = 'your_rds_password'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yourusername/online-e-shopping-store.git' // UPDATE YOUR REPO URL
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t eshop-app .'
            }
        }
        
        stage('Deploy Container') {
            steps {
                sh '''
                    # Stop and remove the old container if it exists
                    docker stop eshop-container || true
                    docker rm eshop-container || true
                    
                    # Run the new container
                    docker run -d \
                      -p 80:8080 \
                      -e DB_URL="${DB_URL}" \
                      -e DB_USER="${DB_USER}" \
                      -e DB_PASSWORD="${DB_PASSWORD}" \
                      --name eshop-container \
                      eshop-app
                '''
            }
        }
    }
}
```

> [!NOTE]
> We map port `8080` from the container to port `80` on the host, so you can access the app just by going to `http://<YOUR_EC2_PUBLIC_IP>`.

7. Save and click **Build Now**.

Your application will be built, containerized, and deployed automatically! You can check the Jenkins console output to monitor the build process.
