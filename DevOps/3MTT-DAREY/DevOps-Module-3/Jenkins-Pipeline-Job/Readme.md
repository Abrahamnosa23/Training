# 🚀 Jenkins Pipeline Job: CI/CD with GitHub and Docker

## 📘 Introduction

A **Jenkins Pipeline Job** is a powerful way to define and automate a complete **software delivery process** — from source code checkout to build, test, and deployment — using code.  

Pipelines represent **Continuous Integration (CI)** and **Continuous Delivery (CD)** practices in action, enabling teams to:
- Version control their build process
- Visualize workflows
- Eliminate manual steps
- Deliver software faster and more reliably

In this project, we’ll build a Jenkins pipeline that:
1. Connects to a GitHub repository  
2. Builds a Docker image using a `Dockerfile`  
3. Runs a container automatically upon code changes  

This project automates the process you previously performed manually in the **Docker Foundations** module — but this time, with **Jenkins CI/CD**.

---

## 🧩 What is a Jenkins Pipeline Job?

A **Pipeline Job** in Jenkins defines and automates a sequence of steps in your build, test, and deployment process.  
Unlike freestyle projects, pipelines are defined as **code (Jenkinsfile)** — offering versioning, flexibility, and automation benefits.

### 🔧 Benefits of Jenkins Pipelines
- **Automation:** No manual steps — everything runs automatically.
- **Version Control:** The pipeline definition is stored in your Git repository.
- **Consistency:** Every build follows the same process.
- **Visibility:** Pipelines are visualized in the Jenkins console.

---

## 🧠 Creating a Pipeline Job

### Step 1: Create a New Pipeline Project
1. From your **Jenkins Dashboard**, click **“New Item.”**  
2. Enter a name — for example:  
My pipeline job

yaml
Copy code
3. Select **“Pipeline”** as the project type and click **OK.**

---

## 🔁 Configuring Build Triggers

We want Jenkins to automatically trigger new builds whenever code changes are pushed to GitHub.

1. Click **Configure** on your pipeline job.  
2. Scroll to **Build Triggers.**  
3. Select **“GitHub hook trigger for GITScm polling.”**  
4. Since you already have a GitHub webhook from the previous project, you don’t need to create a new one.  

> 💡 Jenkins will now automatically start a build when you push updates to your GitHub repository.

---

## 🧰 Writing the Jenkins Pipeline Script

The **Pipeline Script** defines how Jenkins executes your CI/CD workflow.  
You can write it in **Declarative** or **Scripted** syntax — we’ll use the declarative format for simplicity.

---

### Step 2: Use the Pipeline Snippet Generator

1. In Jenkins, open your job configuration page.  
2. Scroll to the **Pipeline** section and click **“Pipeline Syntax.”**  
3. Select the **“checkout: Check out from version control”** option.  
4. Enter your repository URL and confirm the branch is **main.**  
5. Click **Generate Pipeline Script.**

This generates a `checkout` snippet to connect Jenkins with your GitHub repo.  
You’ll integrate this into your main pipeline code.

---

## 🐳 Installing Docker on the Jenkins Instance

Before Jenkins can build or run Docker images, Docker must be installed on the same instance as Jenkins.

### Step 3: Install Docker Using Shell Script
1. Create a new file named **`docker.sh`**  
2. Paste the script below:

```bash
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to APT sources:
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl status docker
```

Make the script executable:

```bash
chmod u+x docker.sh
```

Run the script:

```bash
./docker.sh
```

✅ Docker is now installed and ready to use.

## 🧱 Building the Pipeline Script

Now that Docker is installed, let’s define a pipeline that:

1. Connects to your GitHub repository
2. Builds a Docker image from a Dockerfile
3. Runs a Docker container exposing port 8081

Step 4: Prepare Your Repository

1. In your GitHub repository (jenkins-scm), create a file named Dockerfile:

```dockerfile
Copy code
# Use the official NGINX base image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html/

# Copy local HTML file to the NGINX public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
```

Create an index.html file in the same directory:

```html
<h2>Congratulations, You have successfully run your first pipeline code.</h2>
```

3. Commit and push these files to your main branch.

🚀 Jenkins will detect this push via the webhook and automatically start the pipeline build.

🧩 Complete Jenkins Pipeline Script
Below is the full Jenkins pipeline definition that automates your CI/CD workflow:

```groovy
Copy code
pipeline {
  agent any
  stages {
    stage('Connect To GitHub') {
      steps {
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'YOUR_GITHUB_REPO_URL']])
      }
    }
    stage('Build Docker Image') {
      steps {
        script {
          sh 'docker build -t dockerfile .'
        }
      }
    }
    stage('Run Docker Container') {
      steps {
        script {
          sh 'docker run -itd --name nginx -p 8081:80 dockerfile'
        }
      }
    }
  }
}


⚙️ Note: Replace YOUR_GITHUB_REPO_URL with your actual repository URL.

🌐 Accessing the Deployed Container
Once the pipeline completes successfully, open your web browser and access the running container via:

```cpp
http://<jenkins-instance-public-ip>:8081
```

If your browser shows the message:

“Congratulations, You have successfully run your first pipeline code.”

🎉 Then your CI/CD pipeline is working perfectly!


## 🔒 Security Group Configuration
Ensure your EC2 instance’s security group allows inbound access to port 8081.

Rule Type	Protocol	Port Range	Source
Custom TCP	TCP	8081	0.0.0.0/0

## ✅ Summary
In this project, you have successfully:

Created a Jenkins Pipeline Job

Connected Jenkins to GitHub

Installed Docker on your Jenkins instance

Built a Docker image and ran a container automatically

Accessed the deployed application via a web browser

You’ve now automated your build and deployment process using Jenkins CI/CD integrated with Docker — a fundamental DevOps practice!

🧭 Next Steps
In the next module, you’ll learn to:

Add automated testing stages

Integrate container scanning and artifact storage

Deploy containers to AWS services (like ECS or EKS)

Author: 3MTT DevOps Learning Path Team
Category: DevOps / CI/CD / Jenkins / Docker
Tools Used: Jenkins · GitHub · Docker · Ubuntu
Difficulty Level: Intermediate
