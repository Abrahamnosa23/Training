
# AWS IAM Security Project: Principle of Least Privilege & MFA

## Project Overview & Business Context

This hands-on project simulates a real-world security setup for Zappy e-Bank, a hypothetical fintech startup. The core objective is to establish a secure foundation on Amazon Web Services (AWS) by implementing robust Identity and Access Management (IAM) controls.

Financial institutions like Zappy e-Bank handle sensitive data, making security and compliance non-negotiable. This project demonstrates how to use AWS IAM to ensure that only authorized individuals have access to specific resources, and only to the extent necessary for their job function—a concept known as the Principle of Least Privilege. We will also enforce Multi-Factor Authentication (MFA) to significantly enhance account security.

## Learning Objectives

By completing this project, you will be able to:

- Explain the critical role of IAM in AWS security and compliance.
- Differentiate between IAM Users, Groups, Policies, and Roles.
- Create custom IAM policies tailored to specific job functions.
- Implement the Principle of Least Privilege by assigning users to groups with scoped permissions.
- Enforce Multi-Factor Authentication (MFA) for user accounts.
- Validate configurations by testing user access and verifying security boundaries.

## Prerequisites

- An AWS account with administrator-level access.
- A basic understanding of cloud computing and AWS core services (EC2, S3).
- A mobile device with an authenticator app (e.g., Google Authenticator or Microsoft Authenticator).

-![1. AWS-Account-Dashboard.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/1.%20AWS-Account-Dashboard.png)

## Core IAM Concepts: The Building Blocks

Before beginning, it's crucial to understand the IAM components we will use:

- IAM User: An identity representing a person or application that interacts with AWS. It contains a name, password, and access keys. (e.g., john, mary).
- IAM Group: A collection of IAM users. Groups allow you to assign permissions to multiple users at once, making management efficient and consistent. (e.g., Development-Team, Analyst-Team).
- IAM Policy: A JSON document that defines permissions—specifying what actions are allowed or denied on which AWS resources. Policies are attached to Users, Groups, or Roles.
- Principle of Least Privilege: The security best practice of granting only the permissions required to perform a specific task, and nothing more. This minimizes the attack surface in case of credential compromise.
- Multi-Factor Authentication (MFA): A security mechanism that requires users to provide two or more forms of verification before gaining access. It combines something they know (password) with something they have (a code from a physical device).

## Step-by-Step Implementation Guide

### Phase 1: Creating Fine-Grained IAM Policies

We start by defining the precise permissions needed for each role, rather than using broad, pre-existing policies.

-![2. AWS-Policies.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/2.%20AWS-Policies.png)

A. Policy for Backend Developers (developer-policy)

Purpose: Grants full access to EC2 instances for deploying and managing application servers.

1. Navigate to the IAM Console > Policies > Create policy.
2. Use the Visual editor for ease:
  - Service: Select EC2.
  - Actions: Select All EC2 actions. This allows John to launch, terminate, and manage all aspects of EC2 instances.
  - Resources: Select All resources. For a development environment, this is acceptable. For production, you would scope this down to specific instances.
3. Click Next.
4. Name: developer-policy
5. Description: Allows full access to EC2 instances for backend development teams.
6. Click Create policy.

-![3. EC2-Policies.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/3.%20EC2-Policies.png)

-![4. EC2-Policies1.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/4.%20EC2-Policies1.png)

-![5. EC2-Policies2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/5.%20EC2-Policies2.png)

-![6. EC2-Policies-created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/6.%20EC2-Policies-created.png)

B. Policy for Data Analysts (analyst-policy)

Purpose: Grants full access to S3 for managing data storage buckets, which is essential for data analysis tasks.

1. Repeat the steps above.
2. In the visual editor:
- Service: Select S3.
- Actions: Select All S3 actions (e.g., s3:GetObject, s3:PutObject, s3:CreateBucket).
- Resources: Select All resources.
3. Name: analyst-policy
4. Description: Allows full access to S3 buckets and objects for the data analysis team.
5. Click Create policy.

-![7. S3-Policies.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/7.%20S3-Policies.png)

-![8. S3-Policies-Created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/8.%20S3-Policies-Created.png)

Phase 2: Organizing Users into Groups

Groups are the most efficient way to manage permissions for teams of users.

-![9. user-group.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/9.%20user-group.png)

-![10. User group created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/10.%20User%20group%20created.png)

A. Group for Developers (Development-Team)

1. Navigate to IAM Console > User Groups > Create group.
2. Group name: Development-Team
3. Under Attach permissions policies, search for and select the custom developer-policy you created.
4. Click Create group.

-![11. development-group-created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/11.%20development-group-created.png)

B. Group for Analysts (Analyst-Team)

1. Navigate to IAM Console > User Groups > Create group.
2. Group name: Analyst-Team
3. Under Attach permissions policies, search for and select the custom analyst-policy you created.
4. Click Create group.

-![12. analyst-group-created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/12.%20analyst-group-created.png)

-![13. group-list.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/13.%20group-list.png)

Phase 3: Creating IAM Users and Assigning Them to Groups

Now, create individual identities and assign them to the appropriate group.

-![14. IAM-users.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/14.%20IAM-users.png)

-![22. IAM-users-new.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/22.%20IAM-users-new.png)

A. User for John (Backend Developer)

1. Navigate to IAM Console > Users > Create user.
2. User name: john
3. Select AWS credential type: Ensure Provide user access to the AWS Management Console is selected. This generates a password and a custom sign-in link.
4. Set a Custom password and check User must create a new password at next sign-in. This is a security best practice.
5. Click Next.
6. On the Add user to group page, select the Development-Team group. Do not add the user directly to a policy; always use groups for permission management.
7. Click Next, review the details, and click Create user.
8. CRITICAL: Download the .csv file containing John's sign-in URL, username, and temporary password. This is the only time you can download these credentials.

-![15. john-user-creation.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/15.%20john-user-creation.png)

-![16. john-user-creation1.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/16.%20john-user-creation1.png)

-![17. john-user-created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/17.%20john-user-created.png)

B. User for Mary (Data Analyst)

1. Repeat the steps above.
2. User name: mary
3. On the Add user to group page, select the Analyst-Team group.
4. Create the user and download her credentials.

-![18. mary-user-creation.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/18.%20mary-user-creation.png)

-![19. mary-user-creation1.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/19.%20mary-user-creation1.png)

-![20. mary-user-creation2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/20.%20mary-user-creation2.png)

-![21. mary-user-created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/21.%20mary-user-created.png)

Phase 4: Enforcing Multi-Factor Authentication (MFA)

MFA is essential for protecting against unauthorized access, even if a password is compromised.

-![35. all-users.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/35.%20all-users.png)

Setting Up MFA for John

1. While signed in as an administrator, go to IAM Console > Users.
2. Click on the user john.
3. Go to the Security credentials tab.
4. In the Multi-factor authentication (MFA) section, click Enable.
5. In the setup wizard:
  - Choose Authenticator app as the MFA device type.
  - Click Next.
6. Setup Steps:
  a. On your mobile device, open your authenticator app (e.g., Google Authenticator).
  b. Scan the QR code displayed on the screen with your app. This links the app to your AWS account.
  c. Alternatively, you can manually type the Secret key into your app.
7. In the Authentication code 1 field, enter the 6-digit code currently displayed in your authenticator app.
8. Wait for the code to refresh (about 30 seconds), then enter the next code in the Authentication code 2 field.
9. Click Add MFA.

-![36. john-mfa.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/36.%20john-mfa.png)

-![37. john-mfa1.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/37.%20john-mfa1.png)

-![38. john-mfa2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/38.%20john-mfa2.png)

Repeat this entire process for the user mary.

-![39. mary-mfa.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/39.%20mary-mfa.png)

-![40. mary-mfa1.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/40.%20mary-mfa1.png)

-![41. mary-mfa2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/41.%20mary-mfa2.png)

## Validation and Testing Protocol

Testing is mandatory to ensure configurations work correctly and the Principle of Least Privilege is enforced.

Testing John's Access (Backend Developer)

1. Log in to the AWS Console using John's unique sign-in URL and temporary password. You will be forced to set a new password.
2. Navigate to the EC2 Dashboard. Verify that John can successfully view, launch, stop, and terminate EC2 instances. This confirms the developer-policy is working.
3. Attempt to access the S3 Dashboard. This attempt should fail with an explicit "Access Denied" or "You are not authorized" message. This is the desired behavior, confirming that John cannot access services outside his job requirements.

-![23. john-signin-page.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/23.%20john-signin-page.png)

-![24. john-dashboard.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/24.%20john-dashboard.png)

-![25. john-ec2-creation.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/25.%20john-ec2-creation.png)

-![26. john-ec2-creation1.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/26.%20john-ec2-creation1.png)

-![27. john-ec2-creation2.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/27.%20john-ec2-creation2.png)

-![28. john-ec2-created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/28.%20john-ec2-created.png)

-![34. John-access-denied.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/34.%20John-access-denied.png)

Testing Mary's Access (Data Analyst)

1. Log in to the AWS Console using Mary's unique sign-in URL and temporary password. Set a new password.
2. Navigate to the S3 Dashboard. Verify that Mary can view buckets, create new buckets, and upload files.
3. Attempt to access the EC2 Dashboard. This attempt should also fail, confirming her permissions are correctly restricted to only S3.

-![29. mary-signin-page.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/29.%20mary-signin-page.png)

-![30. mary-dashboard.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/30.%20mary-dashboard.png)

-![31. s3-bucket-creation.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/31.%20s3-bucket-creation.png)

-![32. s3-bucket-created.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/32.%20s3-bucket-created.png)

-![33. mary-access-denied.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Security_Identity_Management_IAM/Screenshot/33.%20mary-access-denied.png)

## Project Reflection & Conceptual Deep Dive

1. The Role of IAM in AWS Security
IAM is the cornerstone of AWS security. It provides centralized control over who is authenticated (can sign in) and who is authorized (has permissions) to use resources in your AWS account. IAM allows Zappy e-Bank to manage users and their level of access to the AWS console, ensuring that employees only have access to the resources necessary for their roles, thereby maintaining a strong security posture and aiding in compliance with financial regulations.

2. IAM Users vs. Groups: A Practical Approach
- Users are for unique identities. You create one for each individual person or system that needs access.
- Groups are for managing permissions at scale. Instead of attaching policies to 10 developers individually, you attach a policy to a Developers group and add all 10 users to it. This ensures consistency and drastically reduces administrative overhead when onboarding new team members or changing permissions for an entire role.

3. The Significance of Custom Policies & Least Privilege
While AWS provides many managed policies, they are often broader than necessary. Creating custom policies allows for precise control, which is the embodiment of the Principle of Least Privilege. For example, a pre-built AmazonEC2FullAccess policy might be acceptable, but creating our own developer-policy reinforces the learning objective and ensures we consciously grant only the permissions we intend to. This practice minimizes the potential damage from accidents or malicious intent.

4. Analysis of the John and Mary Scenario

The configurations for John and Mary are a direct and successful application of security best practices:

- John's Setup: His membership in the Development-Team group with the attached developer-policy gives him perfect access to perform his backend duties on EC2. His explicit denial of access to S3 proves that the Principle of Least Privilege is actively protecting the company's data stores from unnecessary access.
- Mary's Setup: Her membership in the Analyst-Team group with the analyst-policy provides her with all the tools she needs in S3 while protecting the company's compute infrastructure (EC2) from unauthorized access.
- MFA: Enforcing MFA on both accounts adds a critical layer of defense, ensuring that compromised credentials alone are not enough to breach the system. This is especially vital for a fintech company like Zappy e-Bank.

## Conclusion

This project has walked through the end-to-end process of building a secure, scalable, and well-structured AWS environment for distinct team roles. By mastering these IAM fundamentals—custom policies, groups, and MFA—you have built the essential skills required to secure any AWS workload in accordance with industry best practices.
