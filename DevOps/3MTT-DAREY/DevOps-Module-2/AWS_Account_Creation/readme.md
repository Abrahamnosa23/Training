# AWS Account Foundation

## Project Overview
TThis mini project is designed to walk you through the process of creating an Amazon Web Services (AWS) account, providing step-by-step guidance and insights into the intricacies of setting up your AWS account. Before delving into the specifics of account creation, its important to emphasize the fundamental principles of cloud computing, which serve as the foundation for this project. If you're new to the concept of cloud, its recommended to familiarize yourself with cloud computing basics to fully grasp the significance of AWS account creation.

## Project Duration: 2 hours

### Project Goals and Learning Outcomes:

- Understand the basics of AWS Cloud nd its importance for business and individuals
- Successfully create an AWS account and navigate through the setup process
- Learn how to access the AWS Management Console using newly created account credentials
- Gain practical experience in using AWS services effectively for future projects or business needs 

## Table of Contents

1. Cloud Computing Primer
2. Introduction to AWS
3. Prerequisites
4. Step-by-Step Account Creation Guide
5. Security Best Practices & Next Steps
6. Troubleshooting

## 1. Cloud Computing Primer
### What is "The Cloud"?
Imagine your personal computer or phone. It stores your photos, files, and applications locally. The cloud is a metaphor for a global network of powerful, remote servers that function as a massive, centralized digital storage space and processing unit. Instead of storing everything on your local device, you can store it securely on these servers and access it from anywhere with an internet connection. It's like having a magical, infinite backpack for your digital life that you can open from any device, anywhere.

### The "Pay-As-You-Go" Model
A core principle of cloud computing is its economic model. Traditionally, businesses had to invest heavily upfront in physical servers, guessing their future needs. The cloud operates on a pay-as-you-go model. This means:

- You only pay for the specific resources you use (e.g., compute power, storage space, bandwidth).
- If your application becomes popular and needs more resources, you can instantly scale up and your costs will increase proportionally.
- If usage is low, you can scale down and pay less.
- This eliminates large capital expenses and transforms IT costs into flexible operational expenses, making powerful computing accessible to startups and large enterprises alike.

## 2. Introduction to AWS
Amazon Web Services (AWS) is the world's leading cloud provider. It offers over 200 fully-featured services from data centers globally. AWS provides the fundamental computing resources—servers, storage, databases, networking—that businesses use to build sophisticated applications with greater flexibility, scale, and reliability.

### Why AWS for MarketPeak?
For the MarketPeak e-commerce platform, AWS provides the perfect foundation. We can start small with a free-tier EC2 virtual server to host our website. As the store grows, we can seamlessly add services like a managed database (Amazon RDS), a content delivery network (CloudFront), and scaling tools without any upfront hardware costs, paying only for the traffic and resources we consume.

## 3. Prerequisites
Before beginning, ensure you have the following ready:

- A valid email address not previously associated with an AWS account.
- A mobile phone capable of receiving SMS (text messages) or voice calls for verification.
- A valid credit card or debit card for identity verification.
- Personal information for account details (full name, physical address, phone number).

## 4. Step-by-Step Account Creation Guide
### Step 1: Initiate Sign-Up
1. Navigate to the AWS Homepage and click "Create an AWS Account".
2. On the "Create an AWS Account" page:
  - Enter your Root user email address.
  - Choose a unique AWS account name (e.g., marketpeak-prod).
  - Click "Verify email address".

-![aws1](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws1.png)

-![aws2](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws2.png)

### Step 2: Root User Email Verification
3. Check the inbox of the email address you provided.
4. Locate the email from AWS with the subject "AWS Email Verification".
5. Copy the verification code from the email.
6. Return to the AWS sign-up page, paste the code into the field, and click "Verify".

-![aws3](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws3.png)

-![aws6](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws6.png)

### Step 3: Set Root User Credentials
7. Upon successful verification, you will be prompted to set a Root user password.
  - Best Practice: Create a strong, unique password (a combination of uppercase, lowercase, numbers, and symbols). Do not use this password for any other service. Store it securely in a password manager.

8. Click "Continue".

### Step 4: Provide Contact Information & Payment Details
9. On the "Contact Information" page:
  - Select "Personal" account type.
  - Enter your full legal name, phone number, country, and full physical address accurately.

-![aws4](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws4.png)

-![aws5](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws5.png)

10. Read and agree to the AWS Customer Agreement.
11. Click "Continue".
12. You will now be required to enter payment information.
  - Important: AWS uses this to verify your identity. You will not be charged unless your usage exceeds the Always Free tier limits. A temporary authorization hold (typically $1-$3 USD) may appear on your statement and will be reversed shortly thereafter.

13. Enter your credit/debit card details and billing address. Click "Verify and Continue".

-![aws7](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws7.png)

### Step 5: Identity Verification (SMS/Voice Call)
14. To confirm your identity, AWS requires a second factor of verification.
15. Choose your preferred method: Text message (SMS) or Voice call.
16. Select your country code and enter your mobile number accurately.
17. You will be presented with a CAPTCHA. Enter the displayed code to prove you are not a robot.
18. Click "Send" to initiate the verification process.
19. You will receive a one-time password (OTP) on your mobile device within moments.
20. Enter the OTP in the provided field on the AWS sign-up page and click "Continue".

-![aws8](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws8.png)

-![aws9](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws9.png)

### Step 6: Select a Support Plan
21. AWS will prompt you to choose a support plan.
  - Basic plan - Free: Recommended for starting. Includes 24/7 customer service, access to AWS Personal Health Dashboard, and basic Trusted Advisor checks.
  - (Developer, Business, Enterprise plans are paid options with enhanced support).

-[aws4](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws4.png)

22. For this project, select the "Basic plan - Free" option.
23. Click "Complete sign up".

### Step 7: Account Activation & Console Access
24. You will see a confirmation screen: "Your Amazon Web Services account has been successfully created."
25. Click "Go to the AWS Management Console".
26. You will be redirected to the login page. Ensure "Root user" is selected and enter your root user email address. Click "Next".
27. Enter your root user password and click "Sign in".
28. You may be presented with another CAPTCHA. Enter the code and click "Submit".
29. Success! You will see the AWS Management Console dashboard. Your account is now active and ready.

-![aws10](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws10.png)

-![aws11](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/AWS_Account_Creation/Screenshot/aws11.png)

## 5. Security Best Practices & Next Steps
### IMMEDIATE ACTIONS REQUIRED:

1. Enable MFA on Root User: This is critical. The root user has unlimited access to your account and billing. Go to the IAM (Identity and Access Management) service console and enable Multi-Factor Authentication (MFA) using a virtual device (e.g., Google Authenticator, Authy) for the root account. This adds a crucial layer of security beyond just a password.
2. Create an IAM Admin User: Never use the root user for daily tasks. Create a separate IAM user with administrative permissions. Use this user for all console logins and programmatic access.
3. Set up Billing Alarms: In the Cost Management (Billing) console, create budgets and alarms to notify you via email if your projected spending exceeds a defined threshold (e.g., $10). This protects against accidental overuse.

Proceed to Phase 1: With a secure AWS foundation, you can now begin provisioning the EC2 instance to deploy the MarketPeak application.

## 6. Troubleshooting
- "Email is already associated with an account": Use a different email address or attempt to sign in to recover the existing account.
- SMS/Voice OTP Not Received:
  - Double-check the phone number and country code.
  - Check for poor signal or carrier message blocking.
  - Wait 2-3 minutes and click "Send a new code".
  - Try the alternative verification method.
- Credit Card Declined:
  - Verify all card details (number, expiry, CVV, name) are correct.
  - Contact your bank to ensure they are not blocking international transactions or small authorization holds.
  - Try a different credit or debit card.

- CAPTCHA Errors: Refresh the CAPTCHA and type the characters carefully, noting uppercase/lowercase letters.
