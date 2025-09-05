# AWS Resource Automation Script
This project guides you through creating a Bash shell script to automate the provisioning of key AWS resources: EC2 instances and S3 buckets. The script utilizes functions for modularity and arrays for efficient, loop-based resource creation.

## Table of Contents
1.  [Features](#-features) <!-- #-features -->
2.  [Prerequisites](#-prerequisites) <!-- #-prerequisites -->
3.  [Project Structure](#-project-structure) <!-- #-project-structure -->
4.  [Setup and Configuration](#-setup-and-configuration) <!-- #-setup-and-configuration -->
5.  [Usage](#-usage) <!-- #-usage -->
6.  [Functions Overview](#-functions-overview) <!-- #-functions-overview -->
7.  [Contributing](#-contributing) <!-- #-contributing -->
8.  [Security & Compliance](#-security--compliance) <!-- #-security--compliance -->
9.  [Troubleshooting](#-troubleshooting) <!-- #-troubleshooting -->
10. [Summary](#-summary) <!-- #-summary -->
11. [License](#-license) <!-- #-license -->

## Learning Objectives
By completing this project, you will learn and practice:
- Structuring Bash scripts with functions.
- Using the AWS CLI to create EC2 instances and S3 buckets.
- Implementing basic error checking in scripts.
- Working with arrays to manage collections of data.
- Using environment variables for configuration.

## Features
- **Modular Design:** Uses Bash functions for clean, maintainable, and reusable code.
- **Bulk Resource Creation:** Leverages arrays to efficiently create multiple S3 buckets for different departments in a single loop.
- **Basic Error Handling:** Checks the exit status ($?) of AWS CLI commands to provide success/failure feedback.
- **Environment-Based Configuration:** Key parameters are defined as variables for easy management and compliance with different environments (e.g., dev, prod).

## Prerequisites
Before using this script, ensure you have the following:
1. AWS Account: An active AWS account with appropriate permissions.
2. AWS CLI v2: Installed and configured on your machine.
    - Installation Guide: ![AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
3. IAM Permissions: The AWS user/role configured for the CLI must have a policy granting permissions for:
    - ec2:RunInstances
    - s3:CreateBucket
    - s3:ListAllMyBuckets
    - iam:CreateRole (if using advanced IAM instance profiles)
4. Key Pair: An existing EC2 Key Pair in your target AWS region.
5. Security Group: An existing Security Group configured to allow intended traffic (e.g., SSH on port 22).

## Project Structure
~~~bash
aws-resource-automation/
├── scripts/
│   └── aws_resource_creator.sh  # Main automation script
├── configs/
│   └── example.env              # Example environment configuration file
├── docs/
│   └── IAM_POLICY.example.json  # Example IAM policy for required permissions
├── README.md                    # This file
└── CONTRIBUTING.md              # Guidelines for contributors (optional)
~~~

## Setup and Configuration

### Step 1: Create and Configure Your Key Pair
This key is essential for creating an EC2 instance.
1. Log in to the AWS Management Console and navigate to the EC2 service.
2. In the left sidebar, under Network & Security, click Key Pairs.
3. Click the Create key pair button.
4. Enter a name (e.g., my-automation-key).
5. Choose key pair type: RSA and Private key file format: .pem.
6. Click Create key pair. The .pem file will download automatically. Store it in a secure location (e.g., ~/.ssh/).

### Step 2: Initialize Your Shell Script
Create a new file for your script and set it as executable.
~~~bash
touch aws_resource_creator.sh
chmod +x aws_resource_creator.sh
~~~

Open the file in a text editor (e.g., nano, vim, or VS Code) and start with the shebang line.

~~~bash
#!/bin/bash
~~~

### Step 3: Define the EC2 Instance Creation Function
This function will use the aws ec2 run-instances command.
1. Add the function to your script:
~~~bash
# Function to create an EC2 instance
create_ec2_instance() {
    # Configuration using environment variables
    local ami_id="ami-0abcdef1234567890"  # Replace with a valid AMI ID for your region
    local instance_type="t2.micro"
    local count=1
    local security_group_id="sg-0abcdef1234567890" # Replace with your Security Group ID
    local key_name="my-automation-key"      # Replace with your key pair name
    local region="us-east-1"                # Replace with your preferred region

    echo "Creating an EC2 instance..."
    # The AWS CLI command to create the instance
    aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --count "$count" \
        --security-group-ids "$security_group_id" \
        --key-name "$key_name" \
        --region "$region"

    # Check if the previous command was successful
    if [ $? -eq 0 ]; then
        echo "EC2 instance created successfully."
    else
        echo "EC2 instance creation failed."
    fi
}
~~~

2. Critical Configuration:
- ami_id: Find a valid AMI ID for your region (e.g., an Amazon Linux 2 AMI) from the EC2 Console Launch Instance wizard.
- security_group_id: You must create a Security Group in the VPC section of the EC2 console that allows at least SSH (port 22) access. Replace the placeholder with its ID.

### Step 4: Define the S3 Bucket Creation Function using an Array
This function will use an array to hold department names and a loop to create multiple buckets.
1. Add the function to your script:
~~~bash
# Function to create S3 buckets for different departments
create_s3_buckets() {
    # Define an array containing department names
    local departments=("Marketing" "Sales" "HR" "Operations" "Media")
    local company_prefix="my-company"  # Replace with your unique prefix
    local region="us-east-1"           # Replace with your region

    echo "Starting S3 bucket creation..."

    # Loop through each department in the departments array
    for department in "${departments[@]}"; do
        # Construct the unique bucket name
        local bucket_name="${company_prefix}-${department}-Data-Bucket"
        echo "Creating bucket: $bucket_name"

        # The AWS CLI command to create the bucket
        aws s3api create-bucket \
            --bucket "$bucket_name" \
            --region "$region"

        # Check the exit status of the AWS CLI command
        if [ $? -eq 0 ]; then
            echo "Bucket '$bucket_name' created successfully."
        else
            echo "Bucket '$bucket_name' creation failed."
        fi
    done
}
~~~

2. Important Note on S3 Bucket Names:
- S3 bucket names must be globally unique across all of AWS. You must change the company_prefix variable to something unique (e.g., your company name followed by your initials).

### Step 5: Call the Functions
At the end of your script, call the functions you defined to execute them.
~~~bash
# Main script execution
echo "==== AWS Resource Automation Script Started ===="

create_ec2_instance
echo "----------------------------------------"
create_s3_buckets

echo "==== Script Execution Completed ===="
~~~

### Step 6: Run the Script
Execute your script from the terminal.
~~~bash
./aws_resource_creator.sh
~~~

### Step 7: Verify in AWS Console
After the script runs, log in to the AWS Console to verify everything was created correctly.
- Go to EC2 -> Instances: You should see a new t2.micro instance in the running state.
- Go to S3: You should see five new buckets with names following the pattern my-company-<Department>-Data-Bucket.

## Full Script Example
See the combined script (aws_resource_creator.sh) as it should look based on the project instructions.
~~~bash
#!/bin/bash

# Function to create an EC2 instance
create_ec2_instance() {
    local ami_id="ami-0abcdef1234567890"  # REPLACE ME
    local instance_type="t2.micro"
    local count=1
    local security_group_id="sg-0abcdef1234567890" # REPLACE ME
    local key_name="my-automation-key"    # REPLACE ME
    local region="us-east-1"

    echo "Creating an EC2 instance..."
    aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --count "$count" \
        --security-group-ids "$security_group_id" \
        --key-name "$key_name" \
        --region "$region"

    if [ $? -eq 0 ]; then
        echo "EC2 instance created successfully."
    else
        echo "EC2 instance creation failed."
    fi
}

# Function to create S3 buckets for different departments
create_s3_buckets() {
    local departments=("Marketing" "Sales" "HR" "Operations" "Media")
    local company_prefix="my-company" # REPLACE ME
    local region="us-east-1"

    echo "Starting S3 bucket creation..."

    for department in "${departments[@]}"; do
        local bucket_name="${company_prefix}-${department}-Data-Bucket"
        echo "Creating bucket: $bucket_name"

        aws s3api create-bucket \
            --bucket "$bucket_name" \
            --region "$region"

        if [ $? -eq 0 ]; then
            echo "Bucket '$bucket_name' created successfully."
        else
            echo "Bucket '$bucket_name' creation failed."
        fi
    done
}

# Main script execution
echo "==== AWS Resource Automation Script Started ===="

create_ec2_instance
echo "----------------------------------------"
create_s3_buckets

echo "==== Script Execution Completed ===="
~~~

## Contributing
We welcome contributions to improve this automation script. Please follow our guidelines:
1. Fork the Repository and create your feature branch (git checkout -b feature/AmazingFeature).
2. Follow Code Style: Adhere to existing indentation (2 spaces), commenting style, and structure.
3. Test Your Changes: Validate your script changes in a non-production AWS account.
4. Update Documentation: Ensure the README and other docs are updated if you add new features or change functionality.
5. Submit a Pull Request with a clear description of the changes and their purpose.

## Security & Compliance
- **Secrets Management:** This script uses AWS CLI configured credentials. For production use, integrate with AWS IAM Roles (e.g., EC2 Instance Profiles) or a dedicated secrets management tool like AWS Secrets Manager. Do not hardcode credentials in the script.
- **Least Privilege:** The IAM policy attached to the executing user/role should follow the principle of least privilege. An example minimal policy is provided in docs/IAM_POLICY.example.json.
- **Compliance:** Bucket names and tags should adhere to your organization's naming conventions and compliance requirements (e.g., GDPR, HIPAA). Add relevant tags to resources within the script using the --tags flag in AWS CLI commands.

## Troubleshooting
|----------------------------------|-----------------------------------|---------------------------------------------------|
Issue	Possible Cause	Solution
|------------------------------|---------------------------------------|------------------------------------------------|
| An error occurred (AuthFailure) ...	| Invalid AWS credentials or insufficient permissions.	| Run aws configure again. Verify IAM permissions.|
| An error occurred (InvalidAMIID.NotFound)	| The AMI ID does not exist in the current region.	| Specify a valid AMI ID for your chosen region.
| An error occurred (BucketAlreadyExists)	| The S3 bucket name is not globally unique.	| Change the company_prefix variable to a unique value.
| Parameter validation failed:...	| Missing required parameter for AWS CLI command.	| Check for typos in variable names or AWS CLI command syntax.

## Summary
Based on the provided project instructions, I have successfully learned and implemented a shell scripting solution for automating AWS resource creation. My learning encompasses creating modular functions for provisioning EC2 instances and S3 buckets, utilizing environment variables for configuration, implementing error handling through exit status checks ($?), and working with arrays to manage multiple department-specific bucket names. I've mastered AWS CLI commands for both EC2 instance creation (aws ec2 run-instances) and S3 bucket operations (aws s3api create-bucket), including proper parameter substitution and region specification. The project has strengthened my understanding of automating cloud infrastructure through scripting while maintaining code organization through functions and efficient data handling through arrays for scalable resource deployment.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
