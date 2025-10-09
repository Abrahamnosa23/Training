
# Mini Project - Setting Up Secure Authentication to AWS API

## Overview

This mini project demonstrates how to securely authenticate and interact with the **AWS API** through the AWS Command Line Interface (CLI). It focuses on establishing proper AWS Identity and Access Management (IAM) resources and configurations to enable automated scripts to manage **EC2** and **S3** resources programmatically.

The project follows AWS best practices for security, automation, and access management. It is designed as a practical guide for developers, DevOps engineers, and cloud automation professionals.

---

## Project Objectives

By completing this project, you will:

1. Create an IAM Role encapsulating the required permissions for automation scripts.
2. Define an IAM Policy granting **full access** to EC2 and S3.
3. Create an IAM User (`automation_user`) for programmatic access.
4. Assign the IAM Role to the user using the proper AWS trust relationship model.
5. Attach the policy to the user to grant direct permissions.
6. Generate and securely store **Access Keys** for authentication.
7. Install, configure, and verify the AWS CLI on a Linux system.
8. Test connectivity to the AWS API via CLI commands.

---

## Prerequisites

* Active AWS account with administrative privileges.
* Linux environment (native or WSL).
* Basic familiarity with AWS IAM and CLI commands.
* Internet connection and permission to install software.
* Tools: `curl`, `unzip`, and `sudo` privileges.

---

## Project Structure

```plaintext
.

├── README.md                         # Project documentation
└── scripts/                          # (Optional) Bash or automation scripts
    ├── automation-ec2-s3-policy.json     # IAM Policy granting full EC2 & S3 access
    ├── automation-role-trust.json        # Trust policy for automation_role
    ├── allow-assume-role.json            # Inline policy for automation_user
```

---

## Step-by-Step Implementation

### 1. Create IAM Policy (Full EC2 & S3 Access)

Define a policy granting complete control over EC2 and S3 services.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["ec2:*", "s3:*"],
      "Resource": "*"
    }
  ]
}
```

#### Create via CLI

```bash
aws iam create-policy \
  --policy-name AutomationEC2S3FullAccess \
  --policy-document file://automation-ec2-s3-policy.json
```

---

### 2. Create IAM Role and Attach the Policy

Create a role (`automation_role`) trusted by the automation user.

#### Trust Policy Example (`automation-role-trust.json`):

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::ACCOUNT_ID:user/automation_user"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

#### CLI Commands

```bash
aws iam create-role \
  --role-name automation_role \
  --assume-role-policy-document file://automation-role-trust.json

aws iam attach-role-policy \
  --role-name automation_role \
  --policy-arn arn:aws:iam::ACCOUNT_ID:policy/AutomationEC2S3FullAccess
```

---

### 3. Create IAM User for Automation

Create an IAM user (`automation_user`) with **Programmatic Access**.

```bash
aws iam create-user --user-name automation_user
aws iam create-access-key --user-name automation_user
```

> ⚠️ **Important:** Save the Access Key ID and Secret Access Key securely. They are shown only once.

---

### 4. Attach Policy to the User

Grant the same EC2 and S3 access to the user.

```bash
aws iam attach-user-policy \
  --user-name automation_user \
  --policy-arn arn:aws:iam::ACCOUNT_ID:policy/AutomationEC2S3FullAccess
```

---

### 5. Allow User to Assume Role

Add an inline policy to permit `automation_user` to assume the `automation_role`.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Resource": "arn:aws:iam::ACCOUNT_ID:role/automation_role"
    }
  ]
}
```

Attach via CLI:

```bash
aws iam put-user-policy \
  --user-name automation_user \
  --policy-name AllowAssumeAutomationRole \
  --policy-document file://allow-assume-role.json
```

---

### 6. Install AWS CLI (Linux)

Install the latest AWS CLI version 2.

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

---

### 7. Configure AWS CLI

Run the configuration wizard and enter the user credentials.

```bash
aws configure --profile automation
```

Provide:

* **AWS Access Key ID:** (from user)
* **AWS Secret Access Key:** (from user)
* **Default region name:** e.g. `us-east-1`
* **Default output format:** `json`

---

### 8. Verify Setup

Run test commands to validate AWS CLI connectivity.

```bash
aws ec2 describe-regions --output table --profile automation
aws s3 ls --profile automation
```

If these commands succeed without error, setup is complete.

---

## Security Best Practices

✅ **Principle of Least Privilege** — grant only necessary permissions.
✅ **Use IAM Roles** for EC2 instances and Lambda functions instead of static keys.
✅ **Rotate access keys** regularly and delete unused credentials.
✅ **Enable MFA** for all IAM users with console access.
✅ **Log API calls** using AWS CloudTrail.
✅ **Avoid embedding credentials** in code or public repositories.

---

## Troubleshooting

| Issue                 | Likely Cause                   | Resolution                                                           |
| --------------------- | ------------------------------ | -------------------------------------------------------------------- |
| `AccessDenied` error  | Missing IAM permissions        | Ensure the IAM user creating resources has Administrator privileges. |
| CLI command not found | AWS CLI not installed properly | Reinstall CLI using correct architecture binary.                     |
| Invalid credentials   | Wrong key/secret entered       | Run `aws configure` again and re-enter valid credentials.            |

---

## Cleanup Procedure

Run these commands to remove all created resources when no longer needed.

```bash
aws iam delete-access-key --user-name automation_user --access-key-id <ACCESS_KEY_ID>
aws iam detach-user-policy --user-name automation_user --policy-arn arn:aws:iam::ACCOUNT_ID:policy/AutomationEC2S3FullAccess
aws iam delete-user-policy --user-name automation_user --policy-name AllowAssumeAutomationRole
aws iam delete-user --user-name automation_user
aws iam detach-role-policy --role-name automation_role --policy-arn arn:aws:iam::ACCOUNT_ID:policy/AutomationEC2S3FullAccess
aws iam delete-role --role-name automation_role
aws iam delete-policy --policy-arn arn:aws:iam::ACCOUNT_ID:policy/AutomationEC2S3FullAccess
```

---

## Deliverables

To complete the project submission:

* **Documentation:** This README.md
* **Policy JSON Files:** `automation-ec2-s3-policy.json`, `automation-role-trust.json`, `allow-assume-role.json`
* **Screenshots:** CLI configuration and successful command outputs

---

## Author

**Name:** Your Name
**Role:** Cloud/DevOps Engineer
**Date:** October 2025

---

## License

This project is provided under the MIT License. You may modify, reuse, or extend this work with attribution.

---

### Acknowledgements

* **Amazon Web Services (AWS)** for IAM and CLI documentation.
* **OpenAI ChatGPT** for guidance on step-by-step configuration.

---

> **End of README** — This document adheres to international documentation best practices, including clear objectives, prerequisites, security guidelines, and cleanup instructions.
