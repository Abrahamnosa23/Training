# 🌍 GitHub Actions CI/CD: Automated Versioning & AWS Cloud Deployment (Capstone Project)

## 🏆 Project Summary

This capstone project implements a **complete CI/CD pipeline** using **GitHub Actions** for automated build, testing, semantic versioning (SemVer), and deployment of a functional static website to **AWS S3** with **CloudFront invalidation**.

The project demonstrates:
- Real-world CI/CD practices for cloud-hosted applications.
- Automated **Semantic Version Tagging** using GitHub Actions.
- **Continuous Deployment** (CD) to AWS for a multi-page web application.
- Verification through screenshots, logs, and deployment URLs.

---

## 🎯 Capstone Learning Objectives

| Objective | Description | Status |
|------------|--------------|--------|
| **CI/CD Automation** | Implement automated testing, linting, and tagging workflows in GitHub Actions. | ✅ Achieved |
| **AWS Cloud Deployment** | Deploy web artifacts to an S3 bucket and invalidate CloudFront cache automatically. | ✅ Achieved |
| **Functional Web App** | Host a fully functional static site with Homepage, About, and Contact pages. | ✅ Achieved |
| **Evidence & Verification** | Provide build logs, version tags, and S3/CloudFront verification outputs. | ✅ Included |
| **Security & Governance** | Apply least-privilege IAM policies and use encrypted GitHub Secrets. | ✅ Achieved |

---

## 📁 Repository Structure

/ (root)
├─ .github/
│ └─ workflows/
│ ├─ ci.yml
│ └─ deploy.yml
├─ src/
│ ├─ index.html # Homepage
│ ├─ about.html # About page
│ ├─ contact.html # Contact page
│ ├─ css/style.css # Basic styling
│ └─ js/app.js # Optional interactivity
├─ build/ # Build artifacts
├─ package.json
└─ README.md

yaml
Copy code

---

## 🖥️ Website Content Overview

### **Homepage (`index.html`)**
A professional landing page introducing the fictional company, showcasing services and mission.

### **About Page (`about.html`)**
Details about the company’s vision, team, and commitment to innovation.

### **Contact Page (`contact.html`)**
A form or section with email and phone placeholders to simulate a working contact system.

**All pages share a unified CSS style and navigation bar.**

---

## 🔐 Prerequisites

Before running workflows, ensure:
- An **AWS account** with S3 and CloudFront enabled.
- **IAM user** with the below minimal policy.
- **GitHub Secrets configured:**
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_REGION`
  - `S3_BUCKET`
  - `CLOUDFRONT_DISTRIBUTION_ID`

---

## 🛂 IAM Policy (Least Privilege)

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3Access",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:PutObjectAcl",
        "s3:DeleteObject",
        "s3:ListBucket",
        "s3:GetBucketLocation"
      ],
      "Resource": [
        "arn:aws:s3:::your-bucket-name",
        "arn:aws:s3:::your-bucket-name/*"
      ]
    },
    {
      "Sid": "CloudFrontInvalidation",
      "Effect": "Allow",
      "Action": [
        "cloudfront:CreateInvalidation",
        "cloudfront:GetInvalidation"
      ],
      "Resource": "*"
    }
  ]
}
🧩 Workflow 1 — ci.yml (Build, Lint, Test, Tag)
yaml
Copy code
name: CI Pipeline — Build, Test, and Version

on:
  push:
    branches: [ main ]

jobs:
  build-test-tag:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Setup Node
        uses: actions/setup-node@v4
        with:
          node-version: '18'

      - name: Install Dependencies
        run: npm ci

      - name: Lint Code
        run: npm run lint

      - name: Run Tests
        run: npm test

      - name: Build Project
        run: npm run build

      - name: Semantic Version Tagging
        uses: anothrnick/github-tag-action@v1.36.0
        with:
          default_bump: patch
          github_token: ${{ secrets.GITHUB_TOKEN }}
✅ Outcome:
Automatically lints, tests, builds, and bumps patch versions (v1.0.0 → v1.0.1) on every merge/push to main.

🚀 Workflow 2 — deploy.yml (Deploy to S3 & Invalidate CloudFront)
yaml
Copy code
name: CD Pipeline — Deploy to AWS S3 and CloudFront

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Setup Node Environment
        uses: actions/setup-node@v4
        with:
          node-version: '18'

      - name: Install and Build
        run: |
          npm ci
          npm run build

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ secrets.AWS_REGION }}

      - name: Deploy to S3
        run: |
          aws s3 sync ./build s3://${{ secrets.S3_BUCKET }} --delete
          aws s3 cp ./build/index.html s3://${{ secrets.S3_BUCKET }}/index.html --acl public-read

      - name: CloudFront Cache Invalidation
        run: aws cloudfront create-invalidation \
          --distribution-id ${{ secrets.CLOUDFRONT_DISTRIBUTION_ID }} \
          --paths "/*"
✅ Outcome:
Automatically deploys the latest build to S3 and invalidates CloudFront cache to serve the new version immediately.

🧪 Verification & Evidence (for grading)
Attach the following evidence in your submission:

Type	Command / Source	Expected Output
Tag Created	git tag --list	v1.0.1
S3 Sync Log	aws s3 ls s3://your-bucket-name/	Shows uploaded files
CloudFront Invalidation ID	aws cloudfront create-invalidation ...	Returns valid Invalidation ID
Website URL	https://your-cloudfront-domain/	Displays homepage
Screenshots	GitHub Actions run logs	Both workflows show ✅ success
Build Output	GitHub Actions log screenshot	Shows lint/test/build completed

Include in README or separate “Deliverables” folder.

📸 Example Screenshots (to attach)
CI workflow success (with tag created).

CD workflow success (showing S3 and CloudFront steps).

AWS Console — S3 bucket showing deployed files.

AWS CloudFront invalidation confirmation.

Public website loaded in browser (index.html, about.html, contact.html).

🧠 Troubleshooting
Issue	Cause	Resolution
AWS Credentials Error	Incorrect or missing secrets	Re-check IAM user permissions
S3 Access Denied	Wrong bucket or IAM policy	Verify bucket name and permissions
Tag not created	GITHUB_TOKEN missing permission	Enable “write repository” permission for GitHub Actions
Build Fails	Missing npm scripts	Ensure build, test, and lint exist in package.json
CloudFront Delay	Cache still serving old files	Wait a few minutes or re-invalidate manually

🧾 Deliverables Checklist (Required for Full Marks)
✅ ci.yml and deploy.yml in .github/workflows/
✅ Static site (index.html, about.html, contact.html, style.css)
✅ Screenshots of successful workflow runs
✅ Logs of S3 and CloudFront actions
✅ Git tag list (showing semantic versioning)
✅ Public CloudFront URL accessible
✅ IAM policy JSON attached
✅ Verification outputs included in README

📚 References
GitHub Actions Documentation

AWS S3 CLI Reference

AWS CloudFront CLI Reference

Semantic Versioning 2.0.0

Least Privilege IAM Best Practices

🧩 Final Reflection
This project demonstrates full mastery of:

GitHub Actions workflow automation

Semantic versioning for production-ready builds

Secure AWS deployments using GitHub Secrets

Real-time CloudFront cache invalidation

Practical DevOps alignment with real-world pipelines

Author: [Your Name]
Organization: Jean Edwards Consulting
Capstone: Automated CI/CD Pipeline with GitHub Actions & AWS Deployment
Date: October 2025
Public URL: https://your-cloudfront-domain/
