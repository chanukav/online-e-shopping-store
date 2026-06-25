# AWS Deployment & CI/CD Guide for Online E-Shopping Store

This guide outlines how to deploy the application to Amazon Web Services (AWS) using the Free Tier and set up a robust CI/CD pipeline using **Docker**, **Maven**, and **Jenkins**.

---

## 🏗️ Architecture & Cost Optimization
To deploy this application within the AWS Free Tier, we use:
- **Compute Server**: AWS EC2 `t2.micro` or `t3.micro` instance (Ubuntu 22.04 LTS, 1GB RAM, 8GB SSD).
- **Database Server**: AWS RDS MySQL `db.t3.micro` instance.
- **CI/CD Orchestrator**: Jenkins running directly on the EC2 instance.
- **Runtime Environment**: Docker containers running on the EC2 instance.

> [!CAUTION]
> A `t2.micro` instance has only 1GB of RAM. Running Jenkins, Java, and Docker builds on a single instance will exhaust the memory, causing the server to freeze. **Creating a Swap File (documented below) is mandatory.**

---

## 🗄️ Part 1: Setting up the AWS RDS Database

1. Go to the **AWS RDS Console**.
2. Click **Create database** > Choose **Standard create** > Select **MySQL**.
3. Under **Templates**, select **Free tier** (critical to avoid accidental charges).
4. **Settings**:
   * **DB instance identifier**: `eshop-db`
   * **Master username**: `admin`
   * **Master password**: Choose a strong password and save it (e.g. `your_rds_password`).
5. **Connectivity**:
   * **Public access**: Select **No** (best security practice; we will connect via SSH tunnel).
   * Expand **Additional configuration** and specify the **Initial database name**: `gamudalk`.
6. Click **Create database**. This takes about 5 minutes. Once active, note down the **Endpoint** URL.

### Configure RDS Inbound Rules (Security Group)
You must permit incoming traffic on port `3306` from both your EC2 instance and your local computer.
1. Select your database in the RDS Console and click on the **VPC security groups** link.
2. Select the security group from the list, click the **Inbound rules** tab, and select **Edit inbound rules**.
3. Add the following rules:
   * **Rule 1 (For Local PC)**: Type: `MYSQL/Aurora` (Port `3306`) | Source: `My IP` | Description: *Local Workbench*
   * **Rule 2 (For EC2 Server)**: Type: `MYSQL/Aurora` (Port `3306`) | Source: Select your EC2 Security Group ID | Description: *EC2 Application*
4. Click **Save rules**.

---

## 🔌 Part 2: Connecting MySQL Workbench & Importing Local Data

Because the RDS instance is private, you cannot connect to it directly over the internet. You must tunnel your connection through your EC2 instance using SSH.

1. Open **MySQL Workbench** on your local machine.
2. Click the **`+`** icon next to **MySQL Connections** to create a new connection.
3. Set the **Connection Method** dropdown to: **`Standard TCP/IP over SSH`**.
4. Configure the fields:
   * **SSH Hostname**: Your EC2 Instance Public IP (e.g., `54.x.x.x`).
   * **SSH Username**: `ubuntu`
   * **SSH Key File**: Browse and select your downloaded EC2 `.pem` key pair file.
   * **MySQL Hostname**: Paste your **RDS Endpoint** URL.
   * **MySQL Server Port**: `3306`
   * **Username**: `admin`
   * **Password**: Click *Store in Vault...* and enter your RDS master password.
5. Click **Test Connection**. Click **Continue Anyway** if a version warning popup appears. Save the connection once it succeeds.

### Importing your Database:
If you want to import the baseline database schema provided in this repository:
1. Open your new **AWS RDS (SSH Tunnel)** connection in MySQL Workbench.
2. In the Query tab, run:
   ```sql
   CREATE DATABASE gamudalk CHARACTER SET utf8 COLLATE utf8_general_ci;
   ```
3. Go to the **Administration** tab > **Data Import/Restore**.
4. Select **Import from Self-Contained File** and choose the `db/gamudalk.sql` file from your cloned repository directory.
5. In the **Default Target Schema** dropdown, select `gamudalk`.
6. Click **Start Import**.

---

## 🚀 Part 3: Launching & Configuring the EC2 Instance

### 1. Launching EC2
1. Go to the **AWS EC2 Console** > **Launch instances**.
2. **Name**: `Jenkins-Eshop-Server`
3. **AMI**: **Ubuntu Server 22.04 LTS** (Free tier eligible).
4. **Key pair**: Select or create a key pair (`eshop-key.pem`).
5. **Network settings**:
   * Allow SSH traffic from Anywhere (or My IP).
   * Allow HTTP traffic from Anywhere (Port 80).
   * Add Custom TCP Rule: Port **`8080`** from Anywhere (for Jenkins web interface).
6. Click **Launch instance**.

### 2. Configure EC2 Server (SSH Commands)
Connect to your EC2 instance from your terminal:
```bash
ssh -i "eshop-key.pem" ubuntu@<YOUR_EC2_PUBLIC_IP>
```

Execute these setup commands in order:

#### A. Create a 2GB Swap File (Mandatory)
```bash
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

#### B. Install Java 21 & Jenkins (2026 Key Setup)
```bash
sudo apt update
sudo apt install -y fontconfig openjdk-21-jre net-tools

# Fetch official 2026 verification key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add the repository to apt sources
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt-get update
sudo apt-get install -y jenkins
```

#### C. Install Docker & Configure Permissions
```bash
sudo apt install -y docker.io
sudo systemctl enable --now docker

# Add users to the docker group
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins

# Restart Jenkins to apply group changes dynamically
sudo systemctl restart jenkins
```

---

## ⚙️ Part 4: Jenkins Configuration

1. In your browser, open `http://<YOUR_EC2_PUBLIC_IP>:8080`.
2. Manage and unlock your Jenkins instance with these helpful commands:

| Action | Command |
| --- | --- |
| **Get Unlock Password** | `sudo cat /var/lib/jenkins/secrets/initialAdminPassword` |
| **Check Jenkins Status** | `sudo systemctl status jenkins` |
| **Restart Jenkins Service** | `sudo systemctl restart jenkins` |
3. Install recommended plugins and create your admin account.

### 1. Enable Built-In Node Executors (Required)
Modern Jenkins disables running builds on the controller (built-in) node by default. Since you are running a single-server setup, you must enable it:
1. Go to **Manage Jenkins** > **Nodes**.
2. Click the gear icon next to **Built-In Node** > click **Configure**.
3. Change **Number of executors** from `0` to `1` (or `2`).
4. Click **Save**.

### 2. Lower Disk Space Thresholds (Recommended)
Since EC2 instances have limited space, Jenkins might take the node offline if free space drops below 1GB.
1. Go to **Manage Jenkins** > **Nodes** > click **Configure Monitors** (left sidebar).
2. Find **Free Disk Space** and change the threshold from `1GiB` to `200MiB`.
3. Find **Free Temp Space** and change the threshold from `1GiB` to `200MiB`.
4. Click **Save**. Go back to the **Built-In Node** and click **Bring this node back online** if it is offline.

### 3. Add GitHub Personal Access Token (PAT)
Password authentication is deprecated on GitHub. You must use a Personal Access Token:
1. In GitHub: Go to **Settings** > **Developer settings** > **Personal access tokens (classic)** > Generate a classic token with the `repo` scope. Copy the token.
2. In Jenkins: Go to **Manage Jenkins** > **Credentials** > **(global)** > **Add Credentials**.
   * **Kind**: `Username with password`
   * **Username**: Your GitHub username.
   * **Password**: Paste your GitHub Personal Access Token.
   * **ID**: `github-token`
3. Click **Create**.

---

## 🛠️ Part 5: Pipeline & Docker Configuration

1. In Jenkins: Click **New Item** > Name it `Eshop-Deploy` > Select **Pipeline** > Click **OK**.
2. In the configuration window, scroll down to the **Pipeline** script and paste the following:

```groovy
pipeline {
    agent any

    environment {
        // Update these with your RDS Endpoint and credentials
        DB_URL = 'jdbc:mysql://eshop-db.cr68guouud9p.ap-south-1.rds.amazonaws.com:3306/gamudalk?characterEncoding=utf8'
        DB_USER = 'admin'
        DB_PASSWORD = 'your_rds_password'
    }

    stages {
        stage('Checkout') {
            steps {
                // Ensure to replace this with your repo URL
                git branch: 'main', 
                    credentialsId: 'github-token', 
                    url: 'https://github.com/chanukav/online-e-shopping-store.git'
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
3. Click **Save** and select **Build Now** to launch the deployment.

---

## 🧹 Part 6: Maintenance & Disk Cleanup
If your EC2 storage is full, run this cleanup command periodically on the EC2 terminal:
```bash
# Deletes unused docker containers, images, volumes, and build caches
docker system prune -a -f --volumes
docker builder prune -a -f
sudo apt-get clean
sudo journalctl --vacuum-time=1d
sudo rm -rf /tmp/*
```

---

## ⚠️ Notes on Docker Base Images (cgroups v2 JVM bug)
* If Tomcat fails with a `NullPointerException` regarding `CgroupInfo.getMountPoint()` in the logs, it is because older Java 17 versions do not support modern Linux kernels utilizing cgroup v2. 
* To prevent this, always build your application using a patched, active JDK distribution like Eclipse Temurin in your `Dockerfile`:
  ```dockerfile
  FROM tomcat:9.0-jre17-temurin
  ```
