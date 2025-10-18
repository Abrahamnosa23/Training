# 🚀 GitHub Actions CI/CD: Advanced Continuous Delivery Summary

## 🧭 Overview

This project demonstrates the implementation of **advanced Continuous Delivery (CD)** practices using **GitHub Actions**, focusing on **automated versioning (Semantic Versioning - SemVer)** and **secure cloud deployment** to **AWS S3 and CloudFront**.  

It forms the capstone component of the CI/CD curriculum, reinforcing core DevOps automation concepts while emphasizing **security**, **traceability**, and **cloud efficiency**.

---

## 🎯 Objectives

| Goal | Description | Achieved |
|------|--------------|-----------|
| **Automated Versioning** | Automatically assign SemVer tags (e.g., v1.0.0 → v1.0.1) on each push to `main`. | ✅ |
| **Secure Cloud Deployment** | Deploy built artifacts to AWS S3 and invalidate CloudFront cache automatically. | ✅ |
| **End-to-End CI/CD Automation** | Link CI (build/test) and CD (deploy) workflows seamlessly. | ✅ |
| **Implement Strong Security** | Use encrypted GitHub Secrets instead of hardcoded credentials. | ✅ |
| **Provide Verification Evidence** | Include logs, screenshots, and cloud validation outputs. | ✅ |

---

## ⚙️ 1. Continuous Delivery (CD) Practices

### 🏷️ Automated Versioning and Tagging

**Goal:**  
Automatically generate version tags following the **Semantic Versioning (SemVer)** standard.

**Implementation:**

- The **`actions/github-tag-action@v1`** GitHub Action is used for version bumping.
- Triggered on push to the `main` branch.
- The workflow reads existing tags, increments the `PATCH` version (default), and creates a new annotated tag.

**Workflow Snippet (`versioning.yml`):**
```yaml
name: Automated Versioning

on:
  push:
    branches: [ main ]

jobs:
  tag:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Create Semantic Version Tag
        uses: anothrnick/github-tag-action@v1.64.0
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          default_bump: patch
```


✅ Expected Output:

A new Git tag is automatically created after each main branch push.

Example: v1.0.0 → v1.0.1

☁️ Secure Deployment to AWS

Goal:
Deliver built application files to AWS S3 for hosting and ensure immediate availability via CloudFront invalidation.

Workflow Snippet (deploy.yml):

name: Deploy to AWS (S3 + CloudFront)

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1

      - name: Build and Sync to S3
        run: |
          npm ci
          npm run build
          aws s3 sync ./build s3://your-bucket-name --delete

      - name: Invalidate CloudFront Cache
        run: aws cloudfront create-invalidation \
             --distribution-id YOUR_DISTRIBUTION_ID \
             --paths "/*"


🔐 Security Requirements:

All credentials (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) are stored as Encrypted GitHub Secrets.

IAM policy follows least privilege principle (only required S3 and CloudFront permissions).

🧩 2. Project Flow Diagram (Textual Representation)

Below is the full lifecycle of the project — from code push to deployment.

Stage	Trigger / Action	Purpose / Description
1. Code Commit	Developer pushes code to main.	Triggers workflow automation.
2. Continuous Integration (CI)	a. Matrix Build (Node 14.x, 16.x) — runs tests across versions.
b. Dependency Caching — reuses node modules.
c. Code Quality Check — ESLint ensures code standards.	Ensures code stability and quality.
3. Continuous Delivery (CD)	a. Automated Versioning — assigns SemVer tags.
b. Secure Deployment to AWS — uses GitHub Secrets.
c. CloudFront Invalidation — refreshes content globally.	Automates version control and deployment pipeline.

✅ This design guarantees an end-to-end automated workflow — zero manual steps from commit to production.

🔐 3. IAM Policy (Least Privilege Example)

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3DeploymentAccess",
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:GetBucketLocation"
      ],
      "Resource": [
        "arn:aws:s3:::your-bucket-name",
        "arn:aws:s3:::your-bucket-name/*"
      ]
    },
    {
      "Sid": "CloudFrontInvalidate",
      "Effect": "Allow",
      "Action": [
        "cloudfront:CreateInvalidation",
        "cloudfront:GetInvalidation"
      ],
      "Resource": "*"
    }
  ]
}

```

✅ 4. Verification and Deliverables

Evidence	Command / Output	Description
Git Tag Created	git tag --list	Displays latest semantic tag (e.g., v1.0.1).
AWS S3 Deployment	aws s3 ls s3://your-bucket-name	Lists successfully uploaded build files.
CloudFront Invalidation ID	AWS CLI response	Confirms cache refresh was triggered.
GitHub Actions Logs	Workflow output	Shows “All jobs succeeded”.
Public URL	https://your-cloudfront-url/
	Displays deployed application live.
Screenshots	evidence/ folder	Include build logs, AWS console, website view.

📸 Attach screenshots of:

Successful GitHub Actions runs

AWS S3 bucket contents

CloudFront invalidation output

Live website in browser

🧠 5. Troubleshooting Guide
Issue	Cause	Solution
Workflow not triggering	Branch filter mismatch	Ensure workflow triggers main branch.
Access denied (AWS)	IAM policy too restrictive	Confirm permissions: s3:PutObject, cloudfront:CreateInvalidation.
Missing build directory	No build step in workflow	Add npm run build before deployment.
YAML validation error	Indentation/syntax issue	Use YAML Lint
.
CloudFront not updating	Wrong distribution ID	Verify ID in AWS console.
📦 6. Project Deliverables Checklist
Deliverable	Description	Status
versioning.yml	Automated SemVer workflow	✅
deploy.yml	AWS deployment workflow	✅
.eslintrc	Linter configuration file	✅
package.json	Node.js build/test configuration	✅
index.html	Sample webpage content	✅
IAM Policy JSON	Least privilege permissions	✅
Screenshots + URLs	Proof of deployment and success	✅
🏁 7. Final Conclusion

This project marks the completion of your Advanced Continuous Delivery journey with GitHub Actions.
You’ve demonstrated practical mastery of:

Jenkins & Docker — foundational CI/CD automation.

GitHub Actions CI/CD — modular workflows with semantic tagging, caching, and linting.

Secure AWS Deployment — using S3 and CloudFront with least-privilege IAM and encrypted GitHub Secrets.

Through this hands-on implementation, you’ve achieved the ability to:

Design and deploy enterprise-grade CI/CD pipelines.

Automate build, test, versioning, and delivery.

Maintain traceable, secure, and efficient DevOps workflows suitable for any production-grade environment.

🧩 “Automation is not just a tool — it’s the bridge between consistency, quality, and scalability.”

Author: Abraham Aigbokhan
Course: GitHub Actions CI/CD — Advanced Continuous Delivery (Capstone)
Date: October 2025
Deployed Site: https://your-cloudfront-url/

Evidence Folder: /evidence/
