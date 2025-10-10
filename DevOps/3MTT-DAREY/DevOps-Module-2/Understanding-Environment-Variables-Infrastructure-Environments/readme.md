
# 🌐 Mini Project — Understanding Environment Variables & Infrastructure Environments

### Advanced Implementation: Dynamic AWS Cloud Manager Script (`aws_cloud_manager.sh`)

---

## 📘 Overview

This project explores two foundational concepts in DevOps and cloud automation:  
**Infrastructure Environments** and **Environment Variables.**  

By combining these concepts, we build a **dynamic shell script** that adapts to different cloud environments — *development, testing, and production* — and performs automated AWS operations (like listing EC2 instances and creating S3 buckets) using the AWS CLI.

---

## 🎯 Learning Objectives

- Understand the distinction between **Infrastructure Environments** and **Environment Variables**
- Learn how to manage **environment configurations dynamically**
- Build a reusable **Bash script** that:
  - Accepts runtime parameters
  - Switches configuration automatically
  - Interacts with AWS using the AWS CLI
- Apply **DevOps scripting best practices** (parameter validation, modularity, security)

---

## 🧠 Key Concepts Recap

### 🏗️ Infrastructure Environments
| Environment | Description |
|--------------|--------------|
| **Local (Ubuntu/VirtualBox)** | Used for development and experimentation |
| **Testing (AWS Account 1)** | Used for quality assurance and integration testing |
| **Production (AWS Account 2)** | Live environment where customers use the FiTtech product |

Each environment has unique configurations, credentials, and target infrastructure.

---

### 🔐 Environment Variables

Environment variables store configuration data (like database credentials or API endpoints) that differ between environments.

Example:

| Environment | DG_URL | DG_USER | DG_PASS |
|--------------|--------|----------|----------|
| Local | localhost | dev_user | dev_pass |
| Testing | testing-abassample.com | testing_user | testing_pass |
| Production | production-abassample.com | prod_user | prod_pass |

These variables are dynamically loaded based on the environment argument passed to the script.

---

## ⚙️ Project Requirements

### ✅ Prerequisites
- Ubuntu / MacOS terminal access (or AWS EC2 instance)
- AWS CLI installed and configured  
  ```bash
  sudo apt update
  sudo apt install awscli -y
  aws configure

---

## 🧱 Script: aws_cloud_manager.sh

This script:

- Accepts one argument (local, testing, or production)
- Loads environment variables dynamically
- Uses AWS CLI commands to manage cloud resources based on the selected environment

```bash
#!/bin/bash

# =========================================================
#  AWS Cloud Manager Script
#  Dynamically manages AWS environment resources
# =========================================================

# --- Step 1: Check the number of arguments ---
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    echo "Valid environments: local, testing, production"
    exit 1
fi

ENVIRONMENT=$1

# --- Step 2: Load environment-specific settings ---
case $ENVIRONMENT in
    local)
        echo "Running script for Local Environment..."
        export AWS_PROFILE="local"
        export DG_URL="localhost"
        export DG_USER="dev_user"
        export DG_PASS="dev_pass"
        ;;
    testing)
        echo "Running script for Testing Environment..."
        export AWS_PROFILE="testing"
        export DG_URL="testing-abassample.com"
        export DG_USER="testing_user"
        export DG_PASS="testing_pass"
        ;;
    production)
        echo "Running script for Production Environment..."
        export AWS_PROFILE="production"
        export DG_URL="production-abassample.com"
        export DG_USER="prod_user"
        export DG_PASS="prod_pass"
        ;;
    *)
        echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
        exit 2
        ;;
esac

# --- Step 3: Display environment variables ---
echo "---------------------------------------------------"
echo "Active Environment: $ENVIRONMENT"
echo "AWS Profile: $AWS_PROFILE"
echo "DG_URL: $DG_URL"
echo "DG_USER: $DG_USER"
echo "---------------------------------------------------"

# --- Step 4: Perform AWS operations based on environment ---
echo "Performing AWS operations for $ENVIRONMENT environment..."

if [ "$ENVIRONMENT" == "local" ]; then
    echo "Local environment detected — skipping AWS actions."
    echo "You can run local tests here..."
elif [ "$ENVIRONMENT" == "testing" ]; then
    echo "Listing EC2 instances in Testing Account..."
    aws ec2 describe-instances --profile testing --query "Reservations[*].Instances[*].InstanceId" --output table
    echo "Creating a test S3 bucket..."
    aws s3 mb s3://fittech-testing-bucket-$RANDOM --profile testing
elif [ "$ENVIRONMENT" == "production" ]; then
    echo "Listing EC2 instances in Production Account..."
    aws ec2 describe-instances --profile production --query "Reservations[*].Instances[*].InstanceId" --output table
    echo "Creating a production S3 bucket..."
    aws s3 mb s3://fittech-prod-bucket-$RANDOM --profile production
fi

# --- Step 5: Completion Message ---
echo "---------------------------------------------------"
echo "Script execution completed for: $ENVIRONMENT"
echo "---------------------------------------------------"
```

---

## 🧾 Usage Instructions

1️⃣ Make the Script Executable

```bash
chmod +x aws_cloud_manager.sh
```

2️⃣ Run for Each Environment

```bash
Local Environment
./aws_cloud_manager.sh local
```

- Testing Environment

```bash
./aws_cloud_manager.sh testing
```
- Production Environment

```bash
./aws_cloud_manager.sh production
```

---

## 🧪 Example Output

Testing Environment Example

```bash
Running script for Testing Environment...
Listing EC2 instances in Testing Account...
---------------------------------------------------
| Reservations[*].Instances[*].InstanceId |
---------------------------------------------------
| i-0123456789abcdef0                     |
| i-0abcdef1234567890                     |
---------------------------------------------------
Creating a test S3 bucket...
make_bucket: s3://fittech-testing-bucket-38219
---------------------------------------------------
Script execution completed for: testing
---------------------------------------------------
```

---

## 🧹 Cleanup AWS Resources

To remove the test buckets created during execution:

```bash
aws s3 rb s3://fittech-testing-bucket-38219 --force --profile testing
aws s3 rb s3://fittech-prod-bucket-59012 --force --profile production
```

---

## 🔐 Security Best Practices

- ✅ Use IAM Roles instead of static access keys
- ✅ Limit permissions to required services only (EC2, S3)
- ✅ Store sensitive data in AWS Secrets Manager or Parameter Store
- ✅ Never hardcode credentials in the script
- ✅ Implement logging and audit trails for all production runs

## 🧠 Final Summary

This project successfully demonstrates how environment variables and infrastructure environments interact in real-world DevOps workflows.
Through the aws_cloud_manager.sh script, we achieved dynamic configuration management across multiple AWS accounts, enabling environment-specific automation for EC2 and S3.

The exercise reinforced best practices in scripting, environment handling, and AWS automation — bridging foundational shell scripting skills with modern cloud infrastructure management.

## 🧩 Technologies Used

- Bash (Shell Scripting)
- AWS CLI
- EC2 & S3
- IAM Roles & Profiles
- Linux / Ubuntu

---

## 👨‍💻 Author

Abraham Aigbokhan
DevOps | Cloud Infrastructure | Automation | AWS | Linux

📧 For collaboration or feedback:
abraham.aigbokhan@outlook.com

---

## 📄 License:
This project is open-source under the MIT License.
Feel free to modify and adapt it for learning or production use.
