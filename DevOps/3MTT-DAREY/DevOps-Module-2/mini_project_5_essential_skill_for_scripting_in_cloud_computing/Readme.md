
# Mini Project – Understanding the Requirements

## Project Context

DataWise Solutions is developing a script to automate the setup of AWS EC2 instances and S3 buckets. This will help their client, a growing e-commerce startup, streamline deployment of a cloud environment for running data science workloads and storing large datasets.

The script is also intended as a learning project, designed to demonstrate 5 critical shell scripting concepts in the context of cloud computing.

## My Understanding of the Requirements

The script must incorporate the following:

1. Functions
    - The script should be modular, with separate functions for tasks like:
        - Creating EC2 instances
        - Creating and configuring S3 buckets
        - Verifying resources
    - This improves readability, maintainability, and reusability.

2. Arrays

    - Arrays will be used to store and manage multiple resources.
    - For example:
        - Storing IDs of all created EC2 instances
        - Tracking multiple bucket names if more than one is created
    - Arrays make it easier to manipulate and verify resources later in the script.

3. Environment Variables

    - The script should read key configuration values from environment variables.
    - Examples:
        - AWS_REGION, AWS_PROFILE → AWS CLI settings
        - Credentials (though normally stored in aws configure)
        - Optional values like KEY_NAME or SECURITY_GROUP_ID
    - Using environment variables increases portability and security by avoiding hard-coding sensitive values.

4. Command Line Arguments

    - The script must accept CLI arguments so users can customize behavior without editing the script.
    - Examples:
        - --ami-id to choose the AMI for EC2
        - --instance-type for instance sizing
        - --bucket-prefix for naming buckets
        - --count to specify number of EC2 instances
    - This allows the script to be flexible and dynamic.

5. Error Handling

    - The script must gracefully handle errors such as:
        - Invalid AMI IDs
        - Bucket name conflicts
        - AWS service failures or permission errors
    - It should:
        - Print clear error messages
        - Exit safely
        - Optionally attempt cleanup (terminate created resources) if a failure occurs
    - This ensures reliability and prevents orphaned resources or unexpected costs.

## What the Final Script Will Achieve

- Automate provisioning EC2 instances for compute tasks.
- Automate S3 bucket creation and configuration (security, versioning, encryption).
- Provide flexibility through CLI arguments and environment variables.
- Demonstrate all 5 essential shell scripting concepts in practice.
- Include verification and optional teardown for safe testing.

## Next Steps

- Phase 1 (this submission): Confirm understanding of requirements (this document).
- Phase 2: Implement the script with the identified concepts.
- Phase 3: Test, verify deployment, and handle cleanup.

## This document reflects my understanding of the project requirements and how the 5 scripting skills will be applied in practice.
