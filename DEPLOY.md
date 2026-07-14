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
2. **Name**: `Eshop-Production-Server`
3. **AMI**: **Ubuntu Server 22.04 LTS** (Free tier eligible).
4. **Key pair**: Select or create a key pair (`eshop-key.pem`).
5. **Network settings**:
   * Allow SSH traffic from Anywhere (or My IP).
   * Allow HTTP traffic from Anywhere (Port 80).
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

#### B. Install Java 21, Git, & Docker
```bash
sudo apt update
sudo apt install -y git fontconfig openjdk-21-jre net-tools docker.io

# Enable Docker service
sudo systemctl enable --now docker

# Allow the default ubuntu user to run Docker commands without sudo
sudo usermod -aG docker ubuntu
```

---

## ⚙️ Part 4: Jenkins Configuration (Local PC)

1. Open Jenkins in your browser on your local machine (usually at `http://localhost:8080`).
2. Complete the initial unlock setup and install the recommended plugins.

### 1. Add GitHub Personal Access Token (PAT)
Password authentication is deprecated on GitHub. You must use a Personal Access Token:
1. In GitHub: Go to **Settings** > **Developer settings** > **Personal access tokens (classic)** > Generate a classic token with the `repo` scope. Copy the token.
2. In Jenkins: Go to **Manage Jenkins** > **Credentials** > **(global)** > **Add Credentials**.
   * **Kind**: `Username with password`
   * **Username**: Your GitHub username.
   * **Password**: Paste your GitHub Personal Access Token.
   * **ID**: `github-token`
3. Click **Create**.

### 2. Add RDS Database Endpoint URL (Secret Text)
To prevent exposing infrastructure details in public git repository, store the database URL in Jenkins:
1. In Jenkins: Go to **Manage Jenkins** > **Credentials** > **(global)** > **Add Credentials**.
   * **Kind**: `Secret text`
   * **Secret**: Paste your database connection URL (e.g. `jdbc:mysql://eshop-db.cr68guouud9p.ap-south-1.rds.amazonaws.com:3306/gamudalk?characterEncoding=utf8`)
   * **ID**: `rds-db-url`
   * **Description**: `AWS RDS Database JDBC URL`
2. Click **Create**.

### 3. Add RDS Database Credentials (Username with Password)
Store your database credentials securely in Jenkins:
1. In Jenkins: Go to **Manage Jenkins** > **Credentials** > **(global)** > **Add Credentials**.
   * **Kind**: `Username with password`
   * **Username**: Enter your RDS Master username (e.g. `admin`).
   * **Password**: Enter your RDS Master password.
   * **ID**: `rds-db-credentials`
   * **Description**: `AWS RDS MySQL database credentials`
2. Click **Create**.

### 4. Configure EC2 Build Agent (SSH Node)
To run build steps directly on the EC2 server, set up the EC2 instance as a build agent:
1. In Jenkins: Go to **Manage Jenkins** > **Nodes** > **New Node**.
2. Set **Node name** to `ec2-agent`, select **Permanent Agent**, and click **Create**.
3. Configure the fields:
   * **Description**: `AWS EC2 Production Build Agent`
   * **Number of executors**: `1`
   * **Remote root directory**: `/home/ubuntu/jenkins`
   * **Labels**: `ec2-agent`
   * **Usage**: `Only build jobs with label expressions matching this node`
   * **Launch method**: Select **Launch agents via SSH**.
     * **Host**: Enter your EC2 Public IP address.
     * **Credentials**: Click **Add** > **Jenkins**:
       * **Kind**: `SSH Username with private key`
       * **ID**: `ec2-ssh-key`
       * **Username**: `ubuntu`
       * **Private Key**: Select *Enter directly*, click *Add*, and paste the contents of your `eshop-key.pem` private key.
       * Click **Add**.
     * Select `ubuntu (ec2-ssh-key)` in the Credentials dropdown.
     * **Host Key Verification Strategy**: Select **Non-verifying Verification Strategy**.
4. Click **Save**. The agent will start connecting. Check the node status to ensure it goes online (In-service).

---

## 🛠️ Part 5: Pipeline & Docker Configuration

To configure Jenkins to pull the `Jenkinsfile` directly from Git:

1. In Jenkins: Click **New Item** > Name it `Eshop-Deploy` > Select **Pipeline** > Click **OK**.
2. In the configuration window, scroll down to the **Pipeline** section.
3. Change the **Definition** dropdown from **Pipeline script** to **Pipeline script from SCM**.
4. Configure the **SCM** settings:
   * **SCM**: Select **Git**.
   * **Repository URL**: `https://github.com/chanukav/online-e-shopping-store.git` (Update this with your own repository URL if you have a private fork).
   * **Credentials**: Select your GitHub credentials (`github-token` created in Part 4, Step 3).
   * **Branch Specifier (blank for 'any')**: Change it to `*/main` (or the branch you want to build).
5. In **Script Path**, ensure it is set to `Jenkinsfile` (this points to the file at the root of the repository).
6. Click **Save**.
7. Select **Build Now** from the left sidebar to launch your deployment pipeline.


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
