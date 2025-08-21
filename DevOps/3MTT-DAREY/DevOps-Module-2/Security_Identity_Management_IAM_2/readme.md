# AWS Identity and Access Management (IAM) Security Project

## Project Overview
This comprehensive hands-on project provides practical experience with AWS Identity and Access Management (IAM), the foundational security service for controlling access to AWS resources. The scenario involves configuring secure access for employees at a growth marketing consultancy, GrowNowFast.com.

You will learn to implement the Principle of Least Privilege by creating custom policies, managing users and groups, and enforcing Multi-Factor Authentication (MFA). The project contrasts two permission management methods: attaching policies directly to users and the scalable best practice of using groups.

### Learning Objectives

Upon completion, you will be able to:

- Articulate the purpose and core components of AWS IAM (Users, Groups, Roles, Policies).
- Differentiate between AWS Managed Policies and Customer Managed Policies.
- Author custom IAM policies to grant precise permissions for specific job functions.
- Implement scalable access control by organizing users into groups.
- Enforce enhanced security by enabling Multi-Factor Authentication (MFA) for all users.
- Validate configurations to ensure adherence to the Principle of Least Privilege.

### Prerequisites

- An AWS account with administrator-level access.
- A basic understanding of AWS services (EC2, S3).
- A mobile device with an authenticator app (e.g., Google Authenticator, Microsoft Authenticator).

## Core IAM Concepts

IAM is the gatekeeper for your AWS resources, controlling who (authentication) can do what (authorization).

- IAM User: A unique identity for a person or application requiring long-term access (e.g., eric, jack). Each user has unique credentials.
- IAM Group: A collection of IAM users. This is a best practice for managing permissions for teams (e.g., Development-Team). Permissions assigned to the group apply to all its members.
- IAM Policy: A JSON document that defines permissions. There are three types:
  - AWS Managed Policies: Predefined by AWS for common use cases (e.g., AmazonEC2FullAccess).
  - Customer Managed Policies: Custom policies you create and control. This project focuses on these for tailored, least-privilege access.
  - Inline Policies: Policies embedded directly into a single user, group, or role. (Not recommended for general use).
- Principle of Least Privilege (PoLP): The security best practice of granting only the permissions absolutely necessary to perform a task. This minimizes the attack surface.
- Multi-Factor Authentication (MFA): A security mechanism that requires a second form of verification (a time-based code from a physical device) in addition to a password.

## Step-by-Step Implementation Guide

### Phase 1: Creating a Custom Customer Managed Policy

We avoid using broad AWS Managed Policies and instead create a tailored policy.

1. Navigate to the IAM Console > Policies > Create policy.
2. Use the Visual editor.
3. Service: Search for and select EC2.
  - Actions: Select All EC2 actions.
  - Resources: Select All resources.
4. Click Add additional permissions.
5. Service: Search for and select S3.
  - Actions: Select All S3 actions.
  - Resources: Select All resources.
6. Click Next.
7. Name: development-policy
8. Description: Allows full access to EC2 and S3 for the development team.
9. Review the JSON summary to understand the policy structure.
10. Click Create policy.

### Phase 2: Method A - Direct Policy Attachment (User: Eric)

This method is useful for illustrating how policies work but is not scalable for teams.

Creating User Eric and Attaching the Policy

1. Navigate to IAM Console > Users > Create user.
2. User name: eric
3. Select AWS credential type: Check Provide user access to the AWS Management Console.
4. Select Custom password and enter a secure temporary password.
5. Crucial: Check User must create a new password at next sign-in. This enforces credential rotation on first login.
6. Click Next.
7. On the Set permissions page, select Attach policies directly.
8. In the filter box, search for development-policy.
9. Select the checkbox next to your custom development-policy.
10. Click Next.
11. Review the summary and click Create user.
12. CRITICAL: Download the .csv file containing Eric's sign-in URL, username, and password. This is your only chance to get these credentials. Click Return to users list.

### Phase 3: Method B - Group-Based Permission Management (Users: Jack & Ade)

This is the scalable, best-practice approach for managing team permissions.

A. Create the Group (Development-Team) and Attach the Policy

1. Navigate to IAM Console > User Groups > Create group.
2. Group name: Development-Team
3. Under Attach permissions policies, search for and select the development-policy.
4. Click Create group.

B. Create User Jack and Add to the Group

1. Navigate to IAM Console > Users > Create user.
2. User name: jack
3. Follow the same credential setup steps as for Eric (provide console access, set temp password, force change).
4. Click Next.
5. On the Add user to group page, select the Development-Team group.
6. Click Next, review, and click Create user.
7. Download Jack's credentials.

C. Create User Ade and Add to the Same Group

1. Repeat the steps above for a new user named ade.
2. Add ade to the Development-Team group during the user creation process.
3. This demonstrates the power of groups: both jack and ade inherit identical permissions from their group membership instantly and consistently.

### Phase 4: Enforcing Multi-Factor Authentication (MFA)

Repeat this process for all users (eric, jack, ade). MFA is non-negotiable for security.

Setting Up MFA for a User

1. In the IAM Console > Users, click on a user (e.g., eric).
2. Go to the Security credentials tab.
3. In the Multi-factor authentication (MFA) section, click Enable.
4. In the setup wizard:
  - Choose Authenticator app.
  - Click Next.
5. Setup Steps:
  a. On your mobile device, open your authenticator app.
  b. Scan the QR code displayed on the screen. This securely links your app to the AWS account.
  c. Alternatively, you can manually type the Secret key into your app.
6. In the Authentication code 1 field, enter the current 6-digit code from your authenticator app.
7. Wait for the code to refresh (approx. 30 seconds), then enter the next code in the Authentication code 2 field.
8. Click Add MFA.

## Validation and Testing Protocol

Testing is essential to confirm correct configuration and validate the Principle of Least Privilege.

### Testing a User's Access (e.g., Jack)

1. Log in to the AWS Console using Jack's unique sign-in URL and temporary password. You will be prompted to set a new password.
2. Navigate to the EC2 Dashboard. Verify that Jack can successfully view, launch, and manage EC2 instances.
3. Navigate to the S3 Dashboard. Verify that Jack can view, create, and manage S3 buckets.
4. Attempt to access a different service (e.g., IAM, Lambda, RDS). This attempt should fail with an explicit "Access Denied" or "You are not authorized" message.
5. This successful failure is the goal. It confirms that the user only has access to EC2 and S3, and nothing else, perfectly adhering to the Principle of Least Privilege.

Repeat this test for users eric and ade to ensure consistent behavior.

## Project Reflection & Conceptual Deep Dive

1. The Critical Role of IAM

IAM is the bedrock of AWS security and compliance. It provides centralized control over authentication and authorization, ensuring that only the right identities have access to the right resources for the right reasons. For a company like GrowNowFast.com, this is essential for protecting client data and internal assets.

2. Direct Attachment vs. Groups: A Best Practices Analysis

- Attaching Policies Directly (Eric): This method was shown for educational clarity. It becomes an operational burden at scale, as permissions must be managed per user, increasing the risk of inconsistency and error.
- Using Groups (Jack & Ade): This is the internationally accepted best practice. It simplifies user lifecycle management:
  - Onboarding: Add a new user to the appropriate group; they instantly receive all necessary permissions.
  - Permission Changes: Modify the policy attached to the group once, and the change applies to every member instantly.
  - Offboarding: Remove the user from the group to instantly revoke all permissions granted by that group.

3. The Power of Customer Managed Policies

While AWS Managed Policies like AmazonEC2FullAccess are convenient, they are often too broad. Customer Managed Policies are the key to implementing true least privilege. By consciously creating the development-policy, we made a deliberate decision to grant access only to EC2 and S3, explicitly denying all other services by default. This provides superior security and governance.

4. Analysis of the Project Scenario

The project effectively builds from simple to complex:

- User Eric demonstrates the fundamental link between a user and a policy.
- Group Development-Team with users Jack and Ade demonstrates scalable, real-world permission management.
- The Custom development-policy is the central artifact, enforcing a strict security boundary.
- Enforcing MFA on all users protects against the most common attack vector: credential theft.

## Conclusion & Best Practices Summary

This project provided a complete blueprint for securing AWS access. The key takeaways and best practices are:

1. Use Groups to Assign Permissions: Never assign policies directly to users unless absolutely necessary. Always use groups for scalable and consistent access management.
2. Follow the Principle of Least Privilege: Always start with minimal permissions and add more only if explicitly required. Use Customer Managed Policies to achieve this.
3. Enable MFA for All Users: Mandate Multi-Factor Authentication for every user, without exception. This is your strongest defense against account compromise.
4. Use Strong Credential Policies: Enforce password complexity and mandatory rotation on first login.
5. Audit Regularly: Periodically review users, groups, and policies to remove unused permissions and ensure they still align with current requirements.
