
# 🚀 CI/CD Automation Project

## 📘 Overview

This project demonstrates the **end-to-end automation of software delivery pipelines** using both **Jenkins** and **GitHub Actions**.  
It combines foundational CI/CD principles with practical, hands-on implementation to help engineers understand, design, and deploy continuous integration and delivery pipelines efficiently.

The project is divided into two major parts:
1. **Part 1 — Jenkins Freestyle and Pipeline Jobs**
2. **Part 2 — GitHub Actions CI/CD Workflow (YAML-based)**

---

## 🎯 Project Objectives

- Understand how CI/CD automation streamlines software development.
- Configure Jenkins Freestyle and Pipeline jobs for build, test, and deploy workflows.
- Implement automated build triggers via GitHub webhooks.
- Use GitHub Actions workflows for continuous integration and delivery.
- Apply YAML workflow syntax to build, test, and deploy applications.
- Explore environment variables, secrets, and conditional executions for secure, flexible CI/CD.

---

## 🧩 Part 1: Jenkins Freestyle and Pipeline Jobs

### 🧱 Jenkins Freestyle Project

#### Objective
Automate build execution and repository integration using a **Jenkins Freestyle Project**.

#### Steps
1. **Create a Freestyle Job**
   - Go to Jenkins Dashboard → *New Item* → Select *Freestyle project* → Name it `my-first-job`.

2. **Connect to GitHub Repository**
   - Create a repository named **jenkins-scm** on GitHub.
   - Connect Jenkins by adding the repository URL in the Source Code Management section.
   - Ensure the branch selected is `main`.

3. **Configure Build Trigger**
   - Enable **“GitHub hook trigger for GITScm polling”**.
   - Set up a **GitHub Webhook** using your Jenkins public IP and port.
   - Commit and push a change to the repository to verify automated builds.

#### Outcome
A Freestyle job that automatically builds every time a change is pushed to GitHub — demonstrating the **core principle of continuous integration**.

---

### 🧮 Jenkins Pipeline Job

#### Objective
Define and execute a complete CI/CD workflow using **Pipeline as Code**.

#### Steps
1. **Create a Pipeline Job**
   - From Jenkins Dashboard → *New Item* → Select *Pipeline* → Name it `My Pipeline Job`.

2. **Configure Build Trigger**
   - Use the existing GitHub webhook to trigger builds automatically.

3. **Write and Add the Pipeline Script**

```groovy
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
          sh 'docker run -itd -p 8081:80 dockerfile'
        }
      }
    }
  }
}
```

## Explanation

Agent: Specifies the environment where the pipeline runs.

Stage 1 — Connect to GitHub: Clones source code from the main branch.

Stage 2 — Build Docker Image: Uses docker build to create an image from the project’s Dockerfile.

Stage 3 — Run Docker Container: Deploys the Docker container on port 8081.

Outcome

A fully automated Jenkins pipeline that builds and deploys a Dockerized application with every commit.

## ⚙️ Part 2: GitHub Actions CI/CD Workflow

🎓 Overview

GitHub Actions provides a serverless way to automate CI/CD workflows directly within your GitHub repository using YAML configuration files.
This section focuses on building and testing Node.js applications while exploring advanced workflow configurations such as environment variables, secrets, and matrix builds.

## 🧠 Lesson 1: Workflow Syntax and Structure

Key Concepts

- Workflows: Defined in .github/workflows/ directory (e.g., main.yml).
- Jobs: Logical units of work (e.g., build, test, deploy).
- Steps: Specific tasks within each job.
- Actions: Pre-built or custom scripts used within steps.
- Events: Triggers (e.g., push, pull_request).
- Runners: Servers that execute workflows (e.g., ubuntu-latest).

Example

```yaml
name: Example Workflow
on: [push]
```

## 🧪 Lesson 2: Implementing Continuous Integration

Objective

Set up a CI pipeline that automatically builds and tests code after each commit.

Workflow Example

```yaml
name: CI Build and Test

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install dependencies
        run: npm install
      - name: Build application
        run: npm run build
      - name: Run tests
        run: npm test
```

## Explanation

- Checkout Step: Pulls your repository code into the workflow.
- Install Dependencies: Installs all packages from package.json.
- Build Step: Compiles or prepares the code for deployment.
- Test Step: Runs automated tests to validate changes.

## 🔐 Lesson 3: Advanced YAML and Workflow Features

Environment Variables

```yaml
env:
  NODE_ENV: production
```

Secrets Management

```yaml
- name: Use secret
  run: echo "Using API Key: ${{ secrets.API_KEY }}"
```

Conditional Execution

```yaml
if: github.ref == 'refs/heads/main'
```

Data Sharing Between Steps

```yaml
- id: build
  run: echo "::set-output name=artifact::build.zip"
- run: echo "Artifact is ${{ steps.build.outputs.artifact }}"
```

## 🧩 Lesson 4: Build Matrices and Parallel Jobs

Objective

Execute multiple builds in parallel to test across different environments.

```yaml
strategy:
  matrix:
    node-version: [14, 16, 18]

steps:
  - uses: actions/setup-node@v3
    with:
      node-version: ${{ matrix.node-version }}
  - run: npm ci
  - run: npm test
```

## Benefit

Matrix builds enhance test coverage across multiple platforms, ensuring consistency and reliability.

##🧾 Project Deliverables

1. Jenkins Freestyle and Pipeline jobs configured successfully.
2. GitHub webhook integration for automated build triggers.
3. Functional Jenkins pipeline script that builds and deploys Docker containers.
4. Functional GitHub Actions YAML workflow file for CI/CD.
5. Documentation and reflection on automation benefits and outcomes.

## 📚 Learning Outcomes

By completing this project, learners will:

- Understand and apply Jenkins Freestyle and Pipeline Jobs.
- Implement automated CI/CD pipelines using Jenkins and GitHub Actions.
- Use Docker within pipelines for containerized deployments.
- Apply YAML configuration to automate build, test, and deployment processes.
- Secure workflows with environment variables and secrets.
- Establish a foundation for DevOps and cloud-native development practices.

## 🏁 Conclusion

This project marks a critical milestone in mastering CI/CD principles and automation tools.
By integrating Jenkins and GitHub Actions, you’ve learned how to automate code integration, testing, and deployment pipelines—empowering teams to deliver software faster, more reliably, and with greater confidence.

🧩 Additional Resources

- Jenkins Documentation
- GitHub Actions Documentation
- CIS Docker Benchmark
- YAML Syntax Guide
- Node.js Documentation


## Author: Abraham Aigbokhan
Project: CI/CD Automation Project — Jenkins & GitHub Actions
Course: Introduction to CI/CD and DevOps Automation
Institution: ALX — Learning Portfolio
