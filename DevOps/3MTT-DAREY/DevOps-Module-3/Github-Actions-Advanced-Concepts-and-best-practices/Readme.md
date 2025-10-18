
# 🚀 CI/CD Automation with Jenkins & GitHub Actions

## 📘 Project Overview
This project demonstrates **end-to-end CI/CD automation** using two powerful DevOps tools:
- **Jenkins** — for Docker-based continuous integration and deployment.
- **GitHub Actions** — for code testing, linting, and automated deployment of a Node.js application.

Learners will gain practical experience in building automated pipelines, integrating code quality checks, and deploying applications efficiently.

---

## 🧩 Part 1: Jenkins CI/CD with Docker

### 🎯 Objective
Automate the build, packaging, and deployment of a simple static web page using **Jenkins Pipeline Jobs** and **Docker**.

---

### 🧱 1. Creating the Jenkins Pipeline Job
A **Jenkins Pipeline Job** defines a series of automated steps in the software delivery process.

**Steps:**
1. From the Jenkins dashboard, click **“New Item”** → select **Pipeline**.
2. Name the job (e.g., `My pipeline job`).
3. Save and proceed to configure the pipeline.

---

### 🔄 2. Configuring the Build Trigger
To automate builds on code changes:
1. Click **Configure** in Jenkins.
2. Under **Build Triggers**, select:
   > ✅ “GitHub hook trigger for GITScm polling”
3. Create a **GitHub Webhook** using Jenkins’ public IP and port.
4. Push a code update (e.g., modify `README.md`) to the main branch.

✅ **Result:** Jenkins automatically starts a new build triggered by the webhook.

---

### 🐳 3. Installing Docker (Prerequisite)
Docker must be installed on the same instance as Jenkins for the pipeline to execute Docker commands.

Create a shell script named **`docker.sh`** with the following content:

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


Run the script using:

chmod u+x docker.sh
./docker.sh

🧰 4. Pipeline Script and Docker Files
🐋 Dockerfile
FROM nginx:latest
WORKDIR /usr/share/nginx/html/
COPY index.html /usr/share/nginx/html/
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

Stage	Action	Shell Command	Purpose
Connect To GitHub	Clone repository	checkout scmGit(...)	Pulls code from GitHub main branch
Build Docker Image	Build image	docker build -t dockerfile .	Builds the Docker image
Run Docker Container	Deploy container	docker run -itd --name nginx -p 8081:80 dockerfile	Runs container on port 8081
🌍 5. Accessing the Result

After successful execution:

Update inbound rules of your instance to open port 8081.

Access the deployed web page via:
🔗 http://<jenkins-ip>:8081

Expected Output:

“Congratulations, You have successfully run your first pipeline code.”

☁️ Part 2: GitHub Actions CI/CD for Node.js
🎯 Objective

Implement Continuous Integration and Continuous Deployment (CI/CD) using GitHub Actions to automate testing, linting, and deployment of a Node.js application.

🧩 Key GitHub Actions Concepts
Term	Definition
Workflow	Automated process defined in YAML under .github/workflows.
Event	Triggers that start the workflow (e.g., push, pull_request).
Job	Set of steps executed on the same runner.
Runner	The environment executing the workflow (e.g., Ubuntu VM).
Action	Predefined reusable commands like actions/checkout.
🧱 1. Basic CI Workflow (node-js.yml)

This workflow tests a Node.js app across multiple versions using matrix builds.

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

Section	Description	Example
name	Workflow title	node.js CI
on	Trigger events	Push & PR on main
runs-on	OS used	ubuntu-latest
matrix	Node.js versions	14.x, 16.x
steps	Execution steps	Checkout, setup, test

✅ Outcome: Automatically builds and tests code on every push or pull request.

⚙️ 2. Advanced CI — Code Quality & Caching
🧹 Code Linting (ESLint)
- name: Run linter
  run: npx eslint .


Example .eslintrc:

{
  "extends": ["eslint:recommended"],
  "rules": {
    "semi": ["error", "always"],
    "quotes": ["error", "double"]
  }
}

⚡ Dependency Caching
- name: Cache Node Modules
  uses: actions/cache@v2
  with:
    path: ~/.npm
    key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.os }}-node-


Purpose: Speeds up builds by reusing installed dependencies.

🚀 3. CI/CD for Deployment and Releases
🔖 Automated Versioning (SemVer)

Automatically increments patch versions using Semantic Versioning (MAJOR.MINOR.PATCH).

☁️ Deployment (AWS Example)

Deployment triggers on every push to the main branch.

Store Secrets in GitHub:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

- name: Configure AWS Credentials
  uses: aws-actions/configure-aws-credentials@v1
  with:
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    aws-region: us-east-1


✅ Result: Application is built, tested, versioned, and deployed automatically to AWS or your preferred cloud.

🧰 Troubleshooting Tips

Check Action Logs in GitHub for YAML or permission errors.

Validate AWS credentials under repository → Settings → Secrets.

Use YAML linters
 for syntax validation.

🏁 Project Outcome
Tool	Purpose	Outcome
Jenkins	On-premises CI/CD automation	Automated Docker-based pipeline
GitHub Actions	Cloud-based CI/CD	Automated Node.js build, test & deploy
Docker	Containerization	Portable and reproducible deployment
ESLint	Code quality assurance	Ensures clean, standard-compliant code
🧾 Deliverables

Jenkins Pipeline Script and output screenshots

Dockerfile and index.html in repository

GitHub Actions Workflow YAML (.github/workflows/node-js.yml)

ESLint configuration (.eslintrc)

Screenshots of CI/CD execution logs

🎓 Learning Outcomes

By completing this project, you will be able to:

Design automated pipelines using Jenkins and GitHub Actions.

Apply CI/CD principles to real-world projects.

Build and deploy containerized applications.

Integrate code quality tools like ESLint.

Implement cloud deployment automation.

📚 References

Jenkins Documentation

Docker Documentation

GitHub Actions Documentation

Node.js Docs

ESLint Guide

Author: Abraham Aigbokhan
Organization: ALX
Project Title: Jenkins & GitHub Actions CI/CD Automation
Date: October 2025
