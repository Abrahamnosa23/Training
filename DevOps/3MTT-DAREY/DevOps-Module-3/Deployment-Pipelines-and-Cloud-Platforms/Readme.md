
# 🚀 Jenkins CI/CD with Docker & GitHub Actions CI/CD for Node.js

## 📘 Project Overview

This project provides a **comprehensive, hands-on implementation of Continuous Integration and Continuous Deployment (CI/CD)** using two leading automation tools — **Jenkins** and **GitHub Actions**.  

It demonstrates how to build, test, and deploy web applications automatically using **Docker containers** and **Node.js workflows**, helping learners understand end-to-end DevOps automation practices.

---

## 🧩 Part 1: Jenkins CI/CD with Docker

### 🎯 Objective
Automate the **build, packaging, and deployment** of a simple web page using **Jenkins Pipeline Jobs** and **Docker**.

---

### 🧱 1. Creating the Jenkins Pipeline Job

A **Jenkins Pipeline Job** defines and automates a series of steps in the software delivery process.  

**Steps:**
1. From the Jenkins dashboard, click **“New Item”** → select **Pipeline** → name it (e.g., `My pipeline job`).
2. Configure job details such as description, build triggers, and script definition.

This pipeline will automate the entire workflow from **code checkout** to **container deployment**.

---

### 🔄 2. Configuring the Build Trigger

The **Build Trigger** ensures Jenkins automatically starts a new build when changes are pushed to the GitHub repository.

**Steps:**
1. Open the job and click **Configure**.
2. Select **Build Triggers → GitHub hook trigger for GITScm polling**.
3. Create a **GitHub Webhook** using Jenkins’ public IP and port.
4. Make any code change (e.g., update `README.md`) and push it to the `main` branch.

✅ **Result:** Jenkins automatically launches a new build via webhook — enabling continuous integration.

---

### 🐳 3. Installing Docker (Prerequisite)

To build and deploy containerized applications, **Docker must be installed** on the same instance as Jenkins.

Create and run a shell script named **`docker.sh`**:

```bash
# Docker Installation Script
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


This installs and verifies Docker Engine on your Jenkins server.

🧰 4. Pipeline Script and Docker Files

To automate Docker builds and deployment, two files are required:

🐋 Dockerfile
# Use the official NGINX base image
FROM nginx:latest
# Set working directory
WORKDIR /usr/share/nginx/html/
# Copy web content to the container
COPY index.html /usr/share/nginx/html/
# Expose port 80 for web access
EXPOSE 80

🌐 index.html
<!DOCTYPE html>
<html>
  <body>
    <h1>Congratulations!</h1>
    <p>You have successfully run your first Jenkins pipeline code.</p>
  </body>
</html>

🧠 Complete Jenkins Pipeline Script
pipeline {
  agent any
  stages {
    stage('Connect To Github') {
      steps {
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/YourUser/jenkins-scm.git']])
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

Stage	Action	Shell Command/Code	Explanation
Connect To GitHub	Clone source code	checkout scmGit(...)	Connects to GitHub repository and checks out the main branch.
Build Docker Image	Build Docker image	sh 'docker build -t dockerfile .'	Builds a Docker image named dockerfile.
Run Docker Container	Run container	sh 'docker run -itd --name nginx -p 8081:80 dockerfile'	Deploys container on port 8081, accessible via browser.
🌍 5. Accessing the Result

After the build runs successfully:

Edit your server’s security group rules to open port 8081.

Access the deployed site via:
👉 http://<jenkins-ip-address>:8081

Expected Output:
“Congratulations! You have successfully run your first pipeline code.”

✅ Outcome: Fully automated CI/CD pipeline for Dockerized web applications using Jenkins.

☁️ Part 2: GitHub Actions CI/CD for Node.js
🎯 Objective

Automate build, testing, linting, and deployment processes for a Node.js application using GitHub Actions.

🔑 Key GitHub Actions Concepts
Term	Definition
Workflow	YAML-defined automation process located in .github/workflows.
Event	Triggers workflow execution (e.g., push, pull_request).
Job	A collection of steps executed on the same runner.
Runner	Virtual machine that runs the workflow (e.g., Ubuntu).
Action	Reusable automation components like actions/checkout@v2.
🧱 1. Basic CI Workflow (node-js.yml)
Example Workflow
name: node.js CI
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [14.x, 16.x]

    steps:
      - uses: actions/checkout@v2
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v1
        with:
          node-version: ${{ matrix.node-version }}

      - name: Install dependencies
        run: npm ci

      - name: Build and Test
        run: |
          npm run build --if-present
          npm test

Section	Definition	Example/Value
name	Workflow title	node.js CI
on	Event trigger	Push and PR to main
runs-on	Virtual environment	ubuntu-latest
matrix	Test matrix	Node 14.x, 16.x
steps	Commands to execute	Checkout, build, test

✅ Outcome: Code is automatically built and tested across multiple Node.js versions on every commit.

⚙️ 2. Advanced CI — Code Quality and Caching
🧹 Code Quality Check (Linting)

Add a step to run ESLint for maintaining clean, standardized code.

- name: Run linter
  run: npx eslint .


.eslintrc Example:

{
  "extends": ["eslint:recommended"],
  "rules": {
    "quotes": ["error", "double"],
    "semi": ["error", "always"]
  }
}

⚡ Dependency Caching

Use actions/cache@v2 to store dependencies and speed up builds.

- name: Cache Node Modules
  uses: actions/cache@v2
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-node-


✅ Outcome: Future builds reuse cached modules, reducing installation time.

🚀 3. CI/CD for Deployment and Releases
Automated Versioning

Implements Semantic Versioning (SemVer) — MAJOR.MINOR.PATCH.
Automatically increments patch version and tags release on each push to main.

Cloud Deployment (AWS Example)

Store credentials securely as GitHub Secrets:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

Workflow snippet:

- name: Configure AWS credentials
  uses: aws-actions/configure-aws-credentials@v1
  with:
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    aws-region: us-east-1


Deployment Process:

Triggered on push to main branch.

Builds application and uploads to cloud (e.g., AWS S3, ECS, or Lambda).

Validates deployment success and logs results.

Troubleshooting Tips:

Review GitHub Action logs for syntax errors.

Validate credentials under repository → Settings → Secrets.

Use YAML validators to confirm correct indentation and syntax.

🏁 Project Outcome
Tool	Purpose	Outcome
Jenkins	Automate Docker build & deployment	Automated pipeline build on code changes
GitHub Actions	CI for Node.js	Automated build, test, and quality checks
Docker	Containerization	Reproducible deployment environment
ESLint	Code Quality	Enforced coding standards
🧾 Deliverables

Jenkins Pipeline Script and build output screenshots

Dockerfile and index.html in repository

GitHub Actions Workflow YAML (.github/workflows/node-js.yml)

.eslintrc configuration file

Example build logs or screenshots

🧠 Learning Outcomes

By completing this project, you will be able to:

Design and automate multi-stage CI/CD pipelines.

Use webhooks and triggers for real-time build automation.

Integrate code quality checks and linting tools.

Configure Dockerized deployment environments.

Apply DevOps principles across both on-prem (Jenkins) and cloud (GitHub Actions).

📚 References

Jenkins Official Documentation

GitHub Actions Documentation

Docker Documentation

Node.js Documentation

ESLint Configuration Guide

Author: Abraham Aigbokhan
Institution: Jean Edwards Consulting
Course: Advanced CI/CD Implementation and Automation
Project Title: Jenkins CI/CD with Docker & GitHub Actions CI/CD for Node.js

