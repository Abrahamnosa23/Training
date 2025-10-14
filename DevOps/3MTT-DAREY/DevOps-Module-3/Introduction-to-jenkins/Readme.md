# 🧩 Learning Path: Introduction to Jenkins & CI/CD

## 📘 Introduction to CI/CD

**Continuous Integration and Continuous Delivery (CI/CD)** are essential practices that transform how software is built, tested, and delivered.  
They aim to enhance **efficiency**, **reliability**, and **speed** across the entire software development lifecycle.

- **Continuous Integration (CI)**: Developers frequently integrate code into a shared repository. Each integration triggers an **automated build and test**, allowing early detection of bugs or issues.  
- **Continuous Delivery/Deployment (CD)**: Ensures software is always in a **deployable state** by automating the build, test, and release process. This makes deployment fast, repeatable, and reliable.

### 💡 Why CI/CD Matters
The CI/CD pipeline encourages:
- Faster feedback loops  
- Reduced manual intervention  
- Improved release confidence  
- Continuous improvement and innovation  

---

## ⚙️ What is Jenkins?

**Jenkins** is an open-source **automation server** that plays a key role in implementing CI/CD.  
It automates the **build**, **test**, and **deployment** of applications — ensuring consistency and speed throughout the software delivery process.

### 🔑 Jenkins Features:
- **Pipeline as Code** — define build workflows using code (`Jenkinsfile`)
- **Automation** — automate testing, deployment, and reporting
- **Integration** — works with GitHub, Docker, AWS, Kubernetes, and many other tools
- **Plugins** — extend functionality through a rich plugin ecosystem

Jenkins automatically triggers builds when developers push changes to version control, ensuring continuous validation and deployment readiness.

---

## 🧱 Project Pre-requisites

Before starting, ensure you’ve completed:
- **Foundation Core Programs 1 - 3**
- Basic understanding of:
  - Linux command line
  - Git and version control
  - Docker (recommended)
  - Cloud fundamentals (AWS or similar)

---

## 🎯 Project Goals

By the end of this project, you will:
- Understand the principles of **CI/CD**
- Install and configure **Jenkins**
- Create **Freestyle** and **Pipeline** jobs
- Integrate Jenkins with **Source Code Management (SCM)**
- Automate builds and deployments using pipelines

---

## 🧩 Project Highlight (Table of Contents)

1. Introduction to CI/CD  
2. What is Jenkins  
3. Project Pre-requisites  
4. Project Goals  
5. Getting Started With Jenkins  
6. Jenkins Job  
7. Creating a Freestyle Project  
8. Connecting Jenkins to Source Code Management (SCM)  
9. Configuring Build Triggers  
10. Creating a Pipeline Job  
11. Writing Jenkins Pipeline Script  
12. Installing Docker  
13. Building and Running Pipeline Script  

---

## 🚀 Getting Started With Jenkins

### Step 1: Update Package Repositories
Before installing Jenkins, update your package lists to ensure all repositories are up to date.

```bash
sudo apt update
```

## Step 2: Install Java Development Kit (JDK)

Jenkins requires Java. Install it using:

```bash
sudo apt install fontconfig openjdk-17-jre -y
```

Verify installation:

```bash
java -version
```

## Step 3: Install Jenkins

Add the Jenkins repository and GPG key, then install Jenkins:

```bash
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install jenkins -y
```

## Step 4: Verify Jenkins Installation

Check Jenkins service status:

```bash
sudo systemctl status jenkins
```

If not running, start it:

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

## 🌐 Configure Security Group (Port 8080)

By default, Jenkins listens on port 8080.
On your Jenkins instance:

1. Open your AWS Security Group (or equivalent firewall settings)
2. Add an Inbound Rule for TCP 8080 to allow web access

## 🖥️ Set Up Jenkins on Web Console

1. Open your browser and visit:

```cpp
http://<your-public-ip>:8080
```

2. Retrieve your Jenkins unlock password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

3. Copy and paste the password into the Jenkins setup screen.
4. Choose Install Suggested Plugins.
5. Create your admin user account.
6. Log in to the Jenkins Dashboard.

## 🧰 Next Steps

Once Jenkins is up and running:

1. Create your first Freestyle Job (manual configuration)
2. Create a Pipeline Job (Jenkinsfile-based)
3. Connect Jenkins to your GitHub repository
4. Configure Build Triggers (e.g., build on every Git push)
5. Add Docker for containerized builds and deployments

## ✅ Summary

You’ve successfully:

- Learned the core concepts of CI/CD
- Installed and configured Jenkins
- Prepared your environment for automated build pipelines

This foundation will enable you to build continuous integration workflows, streamline deployments, and accelerate software delivery.

## 🧭 Next Module Preview

In the next step, you’ll:

- Write your first Jenkins Pipeline Script
- Automate container builds with Docker
- Integrate Jenkins with GitHub and cloud platforms


Author: 3MTT DevOps Learning Path Team
Category: DevOps / Automation / CI-CD
Tools Used: Jenkins · Docker · Git · Ubuntu
