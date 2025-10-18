
# 🧩 Comprehensive CI/CD Automation Project

## 📘 Overview

This project demonstrates a **complete CI/CD automation workflow** using **Jenkins** for Docker-based deployment and **GitHub Actions** for continuous integration, testing, and code quality assurance in a **Node.js application**.  

It brings together the key components of modern DevOps practice — from source code management to automated build, test, and deployment pipelines — giving learners a full picture of continuous integration and continuous delivery (CI/CD).

---

## 🎯 Project Objectives

- Configure Jenkins for continuous integration and Docker-based deployment.  
- Implement automated build triggers via GitHub webhooks.  
- Write and execute Jenkins pipeline scripts for containerized workflows.  
- Design and configure GitHub Actions workflows in YAML for CI and code quality checks.  
- Implement build matrices and caching to improve pipeline performance.  
- Integrate static code analysis and linters for continuous code quality improvement.  

---

## ⚙️ Part 1 — Jenkins CI/CD with Docker

### 🧱 Jenkins Freestyle Project

#### Objective
Automate the build and integration process between Jenkins and GitHub.

#### Steps

1. **Create a Freestyle Project**
   - From Jenkins Dashboard → *New Item* → Select *Freestyle project* → Name it **my-first-job**.

2. **Connect Jenkins to Source Control**
   - Create a GitHub repository named **jenkins-scm** with a `README.md`.
   - In Jenkins, under **Source Code Management**, paste the repository URL and select the `main` branch.
   - Click **Save** and then **Build Now** to verify connectivity.

3. **Configure Automated Build Trigger**
   - Go to **Configure → Build Triggers → GitHub hook trigger for GITScm polling**.
   - Set up a **GitHub Webhook** pointing to your Jenkins IP address and port.
   - Make a small change (e.g., update `README.md`) and push it — Jenkins should automatically start a build.

#### Outcome
A **Jenkins Freestyle job** that automatically triggers builds on every commit — establishing the foundation of continuous integration.

---

### 🧮 Jenkins Pipeline Job (CI/CD with Docker)

#### Objective
Automate Docker image creation and container deployment using a scripted Jenkins pipeline.

#### Prerequisite — Install Docker
Run the following script on your Jenkins server to install Docker:

```bash
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl status docker
```

🧰 Create Docker Files
Dockerfile
FROM nginx:latest
WORKDIR /usr/share/nginx/html/
COPY index.html /usr/share/nginx/html/
EXPOSE 80

index.html
<!DOCTYPE html>
<html>
  <body>
    <h1>Congratulations!</h1>
    <p>You have successfully run your first Jenkins pipeline code.</p>
  </body>
</html>


Pushing these files to GitHub triggers Jenkins to build and deploy automatically.

🧠 Complete Jenkins Pipeline Script
pipeline {
  agent any
  stages {
    stage('Connect To Github') {
      steps {
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RidwanAz/jenkins-scm.git']])
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

Explanation
Stage	Description
Agent any	Runs pipeline on any available Jenkins node.
Connect To GitHub	Clones the source code from the main branch.
Build Docker Image	Creates a Docker image using the Dockerfile.
Run Docker Container	Launches a container named nginx on port 8081.
Verification

After successful execution:

Update your instance’s security group rules to open port 8081.

Visit: http://<jenkins-ip>:8081

You should see:
“Congratulations! You have successfully run your first pipeline code.”

🌐 Part 2 — GitHub Actions and CI/CD
🧩 Overview

GitHub Actions enables cloud-native CI/CD automation directly within your GitHub repository using YAML-based configuration files.

This section covers:

Building, testing, and linting Node.js applications

Managing environments and secrets

Parallel and matrix builds for multi-version testing

📖 Lesson 1: Understanding CI/CD
Concept	Description
Continuous Integration (CI)	Automatically builds and tests code whenever developers commit changes.
Continuous Deployment (CD)	Automates release of validated builds to production environments.
Benefits	Faster release cycles, improved quality, and reduced manual errors.
⚙️ Lesson 2: Introduction to GitHub Actions
Key Concepts

Workflow: YAML-defined automation pipeline.

Job: A collection of steps run in a single environment.

Step: A task or command in the workflow.

Action: A reusable piece of automation.

Runner: Virtual machine executing your workflow.

Example Workflow Structure
name: Node.js CI
on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install dependencies
        run: npm install
      - name: Build and test
        run: |
          npm run build
          npm test

🧪 Lesson 3: Advanced CI — Matrices, Caching & Linting
Matrix Builds

Run builds on multiple Node.js versions in parallel for cross-version testing.

strategy:
  matrix:
    node-version: [14.x, 16.x]

Dependency Caching

Speed up workflow execution by caching dependencies.

- name: Cache Node Modules
  uses: actions/cache@v2
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-node-

Linting for Code Quality

Integrate static code analysis to ensure coding standards and prevent regressions.

- name: Run Linter
  run: npx eslint .

Sample .eslintrc Configuration
{
  "extends": ["eslint:recommended"],
  "rules": {
    "semi": ["error", "always"],
    "quotes": ["error", "double"]
  }
}

🧾 Project Deliverables

Jenkins Freestyle and Pipeline Jobs (connected to GitHub).

Dockerfile and HTML page deployed via Jenkins Pipeline.

GitHub Actions YAML workflow file for Node.js CI.

Integration of linting, caching, and build matrices in workflow.

Screenshots or verification output of successful build and deployment.

📚 Learning Outcomes

By completing this project, you will:

Configure automated pipelines in both Jenkins and GitHub Actions.

Implement containerized CI/CD workflows with Docker.

Apply best practices in YAML syntax and pipeline modularization.

Use static analysis tools to ensure code quality in continuous integration.

Manage build artifacts, dependencies, and environment variables securely.

🏁 Conclusion

This project integrates Jenkins and GitHub Actions into a cohesive CI/CD framework that automates building, testing, and deploying containerized applications.
You’ve implemented pipelines that reduce human intervention, enhance reliability, and accelerate software delivery — aligning with real-world DevOps standards and enterprise practices.

🌟 Going Beyond the Basics (Optional Enhancements)

Integrate SonarQube or CodeQL for deeper code quality analysis.

Push Docker images to Docker Hub or AWS ECR automatically.

Extend pipeline to deploy on AWS ECS / Azure App Service.

Implement notification steps (Slack, Teams, or email) for build results.

Add security scanning using tools like Trivy or Snyk.

🔗 Useful References

Jenkins Documentation

GitHub Actions Documentation

Docker Documentation

CIS Docker Benchmark

Node.js Official Docs

ESLint Guide

Author: Abraham Aigbokhan
Project: Comprehensive CI/CD Automation Project
Course: Advanced Continuous Integration and Delivery — DevOps Foundations
Institution: ALX — Learning Portfolio
