
# AWS S3 Mini Project: Bucket Management & Lifecycle Configuration
---
## Overview
- This project provides a hands-on guide to core functionalities of Amazon Simple Storage Service (S3). It begins with the essential theoretical concepts of S3 before walking through the practical process of creating a secure S3 bucket, managing objects, implementing version control, configuring public access permissions via bucket policies, and optimizing storage costs with lifecycle rules.
- The project is designed for individuals beginning their cloud journey with AWS, offering a solid theoretical foundation and practical experience in fundamental S3 operations that are critical for real-world data storage and management scenarios.
---
## Project Goals
- To understand the core theory behind Amazon S3, including its benefits, use cases, and key concepts.
- To create and configure a secure Amazon S3 bucket based on best practices.
- To upload objects and manage multiple versions of those objects.
- To understand and configure bucket policies for controlled public access.
- To implement lifecycle policies for automatic cost-saving storage transitions.
---
## Learning Outcomes
Upon successful completion of this project, you will be able to:

- Articulate what Amazon S3 is, its benefits, and common use cases.
- Define key S3 concepts like buckets, objects, keys, versioning, and storage classes.
- Create an S3 bucket with appropriate security settings (Block Public Access, ACLs disabled).
- Upload and manage objects within an S3 bucket.
- Enable and utilize versioning to protect against accidental overwrites and deletions.
- Write and apply a JSON-based bucket policy to grant public s3:GetObject permissions.
- Create a lifecycle rule to automatically transition objects to the S3 Standard-IA storage class after a specified period.
- Understand the cost-benefit analysis of different S3 storage classes.
---
## Theoretical Phase: Understanding Amazon S3

### What is Amazon S3?
Amazon S3 (Simple Storage Service) is a scalable object storage service in AWS. Think of it as a giant virtual filing cabinet in the cloud where you can store and retrieve any amount of data, like files, documents, pictures, and videos, from anywhere on the web. It is designed for 99.999999999% (11 nines) durability and 99.99% availability, making it exceptionally reliable and secure.

### S3 Benefits
- Durability and Reliability: Data is stored redundantly across multiple servers and data centers.
- Scalability: Easily scale your storage from gigabytes to petabytes without any upfront investment.
- Accessibility: Access data from anywhere in the world via the internet.
- Security: Full control over data access through permissions, policies, and encryption.
- Cost-Effectiveness: Pay only for the storage you use with no long-term contracts.

### S3 Use Cases
- Backup & Restore: A safe place for disaster recovery and file backups.
- Static Website Hosting: Host all static resources (HTML, CSS, JS, images) for a website.
- Media Storage & Distribution: Store and deliver videos, images, and music libraries.
- Data Lakes & Big Data Analytics: Store vast amounts of raw data for analysis.
- Application Data Storage: Store user profiles, game saves, and other application assets.

### S3 Core Concepts
- Buckets: Similar to folders, these are containers for storing objects. Each bucket has a globally unique name.
- Objects: The fundamental entities stored in S3 (e.g., files, images). Each object consists of data, a key (unique identifier), and metadata.
- Keys: The unique name assigned to an object within a bucket (e.g., projects/example.txt).
- Storage Classes: Different classes optimized for various use cases:
  - Standard: General-purpose for frequently accessed data.
  - Standard-IA (Infrequent Access): For long-lived, less frequently accessed data (cheaper than Standard).
  - Glacier / Glacier Deep Archive: Lowest cost for long-term archive and digital preservation.
- Versioning: A feature that, when enabled, preserves every version of an object, protecting against accidental deletion or overwrite.
- Access Control: Managed via:
  - Bucket Policies: JSON-based rules applied to a bucket to grant cross-account or public access (used in this project).
  - IAM Policies: Granular permissions attached to IAM users/roles.
  - ACLs (Access Control Lists): A legacy method for granting basic read/write permissions. The modern best practice is to disable ACLs, as done in this project.

### What is S3 Versioning?
Versioning is like a magic undo button for your S3 bucket. When enabled, it saves every version of an object you write to a bucket. This allows you to recover from both accidental deletions and unintended overwrites by restoring a previous version. It is a critical feature for data protection and compliance.

Management Interfaces
- AWS Management Console: A web-based point-and-click interface for managing S3 and other AWS services.
- CLI (Command Line Interface): A tool for controlling AWS services via text commands, ideal for automation and scripting.
- SDKs (Software Development Kits): Libraries for developers to integrate S3 functionality directly into applications in various programming languages.
---
## Prerequisites
- An active AWS Account (Note: S3 incurs costs, but this project remains within the Free Tier limits if eligible).
- Basic familiarity with the AWS Management Console.
- A text file or image to use for the upload and versioning demonstration.
---
## Practical Phase: Step-by-Step Implementation
1. Create an S3 Bucket
  - Navigate to the S3 service in the AWS Console.
  - Click "Create bucket".
  - General Configuration:
    - Bucket name: Choose a globally unique name (e.g., my-unique-bucket-name-2025).
    - AWS Region: Select a region close to you or your users.
  - Object Ownership: Select "ACLs disabled". This is a security best practice, ensuring ownership is solely managed by the bucket owner.
  - Block Public Access: Keep "Block all public access" checked. We will later override this selectively with a bucket policy, which is a more secure method than ACLs.
  - Bucket Versioning: Select "Disable" for now. We will enable it in a later step.
  - Leave all other settings as default and click "Create bucket".

-![AWS_Console.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/AWS_Console.png)

-![s3bucket.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/s3bucket.png)

-[s3bucket2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/s3bucket2.png)

-[s3bucket3.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/s3bucket3.png)

-[s3bucket_created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/s3bucket_created.png)

### Troubleshooting: If you receive a "Bucket name already exists" error, choose a different name. Bucket names must be unique across all of AWS.

-![s3bucket_error_creating.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/s3bucket_error_creating.png)

2. Upload an Object
  - Click on your newly created bucket from the S3 buckets list.
  - Click the "Upload" button.
  - Click "Add files" or "Add folder" and select your demo file (e.g., example.txt).
  - Click "Upload".

-![objectupload.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/objectupload.png)

-[objectupload2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/objectupload2.png)

-[objectupload3.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/objectupload3.png)

-[objectupload4.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/objectupload4.png)

-[objectupload5.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/objectupload5.png)

-[objectupload6.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/objectupload6.png)

3. Enable Versioning
  - Inside your bucket, navigate to the "Properties" tab.
  - Scroll to the "Bucket versioning" section.
  - Click "Edit" and change the status to "Enable".
  - Click "Save changes".
  - Verify: Re-upload a modified version of your file. Navigate to the "Objects" tab and click "Show versions" to see both the original and the new version of your object.

-![enable_versioning.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/enable_versioning.png)

-![enable_versioning2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/enable_versioning2.png)

-![enable_versioning3.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/enable_versioning3.png)

-![enable_versioning4.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/enable_versioning4.png)
  

4. Configure a Bucket Policy for Public Read Access

This step makes a specific object publicly readable while the bucket itself remains locked down.
  - Navigate to the "Permissions" tab of your bucket.
  - Find the "Bucket policy" section and click "Edit".
  - Use the Policy Generator or paste the following JSON policy. Replace my-unique-bucket-name-2025 with your actual bucket name.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::my-unique-bucket-name-2025/*"
        }
    ]
}
```

  - Click "Save changes".
  - Test: Click on an object in your bucket, copy the "Object URL", and paste it into an incognito browser window. The file should be accessible.

-![bucket_permission.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/bucket_permission.png)

-![bucket_permission2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/bucket_permission2.png)

-![bucket_permission3.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/bucket_permission3.png)

-![setting_permission.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission.png)

-![setting_permission2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission2.png)

-![setting_permission3.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission3.png)

-![setting_permission4.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission4.png)

-![setting_permission5.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission5.png)

-[setting_permission6.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission6.png)

-![setting_permission7.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission7.png)

-![setting_permission8.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission8.png)

-![setting_permission9.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission9.png)

-[setting_permission10.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/setting_permission10.png)



-![confirm_permission.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/confirm_permission.png)

-![confirm_permission2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/confirm_permission2.png)



5. Create a Lifecycle Rule

This rule automates cost savings by moving infrequently accessed objects to a cheaper storage class.

  - In your bucket, go to the "Management" tab.
  - Click "Create lifecycle rule".
  - Rule scope: Apply to "All objects" or a specific prefix.
  - Transitions section:
    - Check "Move current versions of objects between storage classes".
    - Select "Standard-IA" from the dropdown.
    - Set "Days after object creation" to 30.
  - Complete the rule creation process. After 30 days, any object in the bucket will be automatically transitioned to Standard-IA.

-![lifecycle.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/lifecycle.png)

-![lifecycle2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/lifecycle2.png)

-![lifecycle3.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/lifecycle3.png)

-![lifecycle4.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/S3_Bucket_Management_Lifecycle_Configuration/Screenshot/lifecycle4.png)

---
## Security Considerations

This project intentionally interacts with security settings. Please be mindful of the following:
  - Principle of Least Privilege: The bucket policy grants public GetObject access. In a production environment, you should restrict the Principal to a specific AWS account or IAM role instead of "*" (everyone) if possible.
  - Block Public Access: We left the account-level "Block Public Access" settings enabled and used a precise bucket policy to grant access. This is the AWS-recommended, secure way to manage public access instead of using ACLs.
  - ACLs Disabled: Using "ACLs disabled" for object ownership simplifies permission management and aligns with modern AWS security best practices, centralizing control with the bucket owner.
  - Clean Up: To avoid ongoing costs, always delete the bucket and all its contents after you complete the project. A non-empty bucket cannot be deleted, so you must delete all objects and their versions first.
---
## Troubleshooting Common Errors

| Error Message | Likely Cause | Solution |
| :--- | :--- | :--- |
| `"The bucket you tried to create already exists..."` | S3 bucket names are globally unique across all AWS accounts. | Choose a more unique name, often by adding numbers or a suffix. |
| `"Access Denied"` when accessing Object URL | 1. Bucket policy has a typo. <br> 2. `Block all public access` is still fully on. <br> 3. The object's ACL is private. | 1. Check the policy JSON and bucket name in the ARN. <br> 2. In the bucket's "Permissions" -> "Block Public Access", ensure no settings are checked that would override the policy. <br> 3. Since we disabled ACLs, this should not be the issue. |
| `"This XML file does not appear to have any style information..."` | The bucket policy is correct, but you are trying to list the bucket's contents (which is not allowed), not get a specific object. | The policy only allows `s3:GetObject`. Use the full, direct URL to a specific file (e.g., `https://my-bucket.s3.region.amazonaws.com/file.txt`). |
| Cannot delete bucket | The bucket is not empty. With versioning enabled, you must delete all object versions. | 1. Go to the "Objects" tab. <br> 2. Click "Show versions". <br> 3. Select all objects and all their versions and choose "Delete". <br> 4. You can then delete the empty bucket. |

---
## AWS & Global Best Practices
This project incorporates several key AWS best practices:
  - Secure by Default: The bucket was created with all public access blocked and ACLs disabled, following the "secure by default" principle.
  - Infrastructure as Code (IaC): While done manually here, these actions (bucket, policy, lifecycle rule) should be defined using AWS CloudFormation or Terraform for reproducible, version-controlled infrastructure in a real-world environment.
  - Cost Optimization: The lifecycle rule demonstrates a fundamental cost optimization technique by automatically moving data to a more appropriate, cheaper storage tier (Standard-IA) based on access patterns.
  - Resource Identification: Using Amazon Resource Names (ARNs) in policies ensures precise targeting of resources.
  - Versioning for Data Protection: Enabling versioning protects against accidental overwrites and deletions, serving as a simple form of data protection and recovery.
  - Documentation: This README itself is a best practice, providing clear instructions and context for anyone needing to use or audit the project.
---
## Project Reflection
This project provided a end-to-end experience, from core theoretical concepts to practical, hands-on implementation with Amazon S3 features. Successfully managing buckets, objects, versioning, security policies, and lifecycle rules builds a strong foundation for working with cloud storage. The concepts learned are directly transferable to real-world scenarios involving data storage, backup solutions, static website hosting, and cost management within AWS.
