# ⚙️ Jenkins Freestyle Project

## 📘 Introduction

This project introduces you to **Jenkins Freestyle Projects** — one of the most versatile and user-friendly features in Jenkins.  
You’ll learn how to **create, configure, and automate** Jenkins jobs to streamline your software development and deployment workflows.

Freestyle projects allow you to define and execute tasks such as:
- Pulling code from a source repository  
- Building and testing applications  
- Deploying software automatically  

---

## 🧩 Jenkins Job Overview

In Jenkins, a **Job** is a fundamental unit of work — a task that Jenkins executes.  
Each job represents a specific automation process within your CI/CD pipeline.

A Jenkins job can:
- Compile and build your application  
- Run automated tests  
- Package and deploy software  
- Trigger other jobs or pipelines  

### 🔧 Core Components of a Jenkins Job
1. **Build Steps** – define what Jenkins should do (e.g., run shell scripts, build code).  
2. **Post-Build Actions** – specify what happens after the build (e.g., deploy artifacts, send notifications).  
3. **Triggers** – define when and how a job should start (manual, scheduled, webhook, etc.).  

---

## 🚀 Creating Your First Freestyle Project

Follow these steps to create and configure your first Jenkins job.

### Step 1: Create a Freestyle Project
1. From the **Jenkins Dashboard**, click **“New Item”** on the left menu.  
2. Enter a name for your project — for example:  

my-first-job

Copy code
3. Select **“Freestyle project”** as the job type and click **OK**.  
4. Jenkins will open the configuration page for your new job.

---

## 🔗 Connecting Jenkins to Source Code Management (SCM)

To enable Jenkins to automatically fetch and build your code, connect it to your **GitHub repository**.

### Step 2: Configure SCM Integration
1. Create a new GitHub repository called **`jenkins-scm`** and include a simple `README.md` file.  
2. In Jenkins, open your `my-first-job` configuration page.  
3. Scroll down to **Source Code Management** and select **Git**.  
4. Paste your repository URL, e.g.:

https://github.com/<your-username>/jenkins-scm.git

Copy code
5. Ensure the **branch** is set to:

main

Copy code
6. Save your configuration.  
7. Click **“Build Now”** from the left panel to run your first build.

### ✅ Verification
After a few moments, you should see:
- A new build number under **Build History**  
- A green ✔️ indicating the build was successful  

Congratulations! Jenkins is now successfully connected to your GitHub repository.

---

## 🔁 Configuring Build Triggers

To make your job truly automated, you’ll configure Jenkins to automatically build your project whenever you push changes to GitHub.

### Step 3: Configure GitHub Webhook Trigger
1. In your Jenkins dashboard, open the job configuration again.  
2. Scroll to **Build Triggers**.  
3. Select **“GitHub hook trigger for GITScm polling.”**  
4. Save the configuration.

### Step 4: Create a GitHub Webhook
1. Go to your **GitHub repository → Settings → Webhooks**.  
2. Click **Add Webhook**.  
3. In the **Payload URL** field, enter:

http://<your-jenkins-public-ip>:8080/github-webhook/

4. Choose **Content type:** `application/json`.  
5. Select **“Just the push event.”**  
6. Click **Add Webhook**.

---

## 🧠 Test the Webhook Automation

To verify that Jenkins triggers automatically:

1. Open your `jenkins-scm` repository.  
2. Edit the `README.md` file and add a simple line (for example:  

Jenkins Webhook Test

3. Commit and push your change to the **main** branch.  
4. Go back to your Jenkins dashboard — a **new build** should trigger automatically.

### 🧾 Expected Outcome
- Jenkins detects the GitHub push event.  
- A new build job is queued and executed.  
- The build history shows the triggered build with the latest timestamp.

If all goes well, you’ve successfully automated your Freestyle Project using a GitHub webhook!

---

## 🧰 Summary

In this module, you’ve learned how to:
- Create a **Jenkins Freestyle Project**  
- Connect Jenkins to a **GitHub repository**  
- Configure **build triggers** for automation  
- Verify successful automatic builds via **webhooks**

These are foundational steps in implementing **Continuous Integration (CI)** — where code is tested and built automatically after each change.

---

## 🧭 Next Steps

In the next module, you’ll:
- Write and execute **Jenkins Pipeline scripts**
- Integrate **Docker** for containerized builds
- Automate complex deployment workflows

---

**Author:** *3MTT DevOps Learning Path Team*  
**Category:** *DevOps / Automation / Jenkins CI/CD*  
**Tools Used:** Jenkins · GitHub · Webhooks · Ubuntu  
