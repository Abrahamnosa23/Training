# AWS IAM Management Script Development Guide

## Configuring AWS CLI and AWS Configure

### Method 1: The Standard Way (Using AWS CLI and AWS Configure)

This is the most common and recommended method.

#### Step 1: Install the AWS CLI

1. Download the AWS CLI MSI installer:

- Go to the official AWS CLI download page: https://aws.amazon.com/cli/
- Under "Windows" click the "AWS CLI MSI installer" link to download the 64-bit version (unless you are on a 32-bit system, which is rare).

2. Run the Installer:

- Double-click the downloaded .msi file.
- Follow the instructions on the screen. You can accept all the defaults.
- The installer will add the aws command to your system's PATH.

3. Verify the Installation:

- Open your terminal. You can use Command Prompt (cmd), PowerShell, or Windows Terminal.
- Run the following command to check the version and confirm it's installed correctly:

```bash
aws --version
```

- You should see output similar to aws-cli/2.15.0 Python/3.11.9 Windows/10 exe/AMD64.

#### Step 2: Configure AWS Credentials

To configure the CLI, you need Access Keys (an Access Key ID and a Secret Access Key) from an IAM user in your AWS account.

A. Get your AWS Access Keys (From the AWS Console):

1. Log in to the AWS Management Console.
2. Open the IAM (Identity and Access Management) service.
3. In the left navigation pane, click Users.
4. Click on your username (or create a new user with Programmatic access enabled).
5. Go to the Security credentials tab.
6. In the "Access keys" section, click Create access key.
7. Choose the use case (e.g., "Command Line Interface (CLI)") and click Next.
8. Click Create access key. THIS IS YOUR ONLY CHANCE TO SEE THE SECRET ACCESS KEY.
9. IMPORTANT: Copy the Access Key ID and Secret Access Key and save them in a secure place. Do not share them or commit them to code.

B. Run the Configure Command:

1. In your terminal, run the following command:

```bash
aws configure
```

2. You will be prompted to enter four pieces of information. Use the keys you just copied:

- AWS Access Key ID [None]: Paste your Access Key ID here
- AWS Secret Access Key [None]: Paste your Secret Access Key here
- Default region name [None]: Enter your preferred AWS region (e.g., us-east-1, eu-west-1)
    - Find your region code: AWS Regions and Endpoints
- Default output format [None]: json (This is the recommended format. You can also use text or yaml)

#### Step 3: Verify the Configuration

Test that everything is working by running a simple command that lists your IAM users. This verifies that your credentials have the necessary permissions.

```bash
aws iam list-users
```

If your configuration is correct, you will see a JSON response listing the IAM users in your account (or an empty list if there are none). If you get an error about permissions, the IAM user you created needs the **IAMReadOnlyAccess** or similar policy attached to it.

## Step 1: Define the IAM User Names Array

The script provides an empty array **IAM_USER_NAMES=()**. We need to populate it with the names of the five IAM users we want to create.

Action: Replace the empty array with the list of usernames. It's good practice to use a naming convention.

Code:

```bash
# Define IAM User Names Array
IAM_USER_NAMES=("devops-user1" "devops-user2" "devops-user3" "devops-user4" "devops-user5")
# You can also use: IAM_USER_NAMES=("devops-user-{1..5}") but the expansion is trickier in shell arrays.
```

Thought Process: "I need to create five users. Storing their names in an array is the most efficient way because I can then loop through this single array for both user creation and group assignment, making the script DRY (Don't Repeat Yourself). If the company needs to add more users later, they only need to update this array."

## Step 2: Create the IAM Users by Iterating Through the Array

We need to fill in the **create_iam_users** function. The AWS CLI command to create a user is **aws iam create-user --user-name <username>**.

Action: Inside the function, write a for loop that iterates over each username in the IAM_USER_NAMES array and executes the create-user command.

Code (to replace the echo statement in the function):

```bash
create_iam_users() {
    echo "Starting IAM user creation process..."
    echo "-------------------------------------"

    for USER_NAME in "${IAM_USER_NAMES[@]}"; do
        echo "Creating IAM user: $USER_NAME"
        aws iam create-user --user-name "$USER_NAME"
        # Check if the previous command was successful
        if [ $? -eq 0 ]; then
            echo "Success: User $USER_NAME created."
        else
            echo "Error: Failed to create user $USER_NAME. It might already exist."
        fi
        echo "" # Adds a blank line for readability
    done

    echo "------------------------------------"
    echo "IAM user creation process completed."
    echo ""
}
```

Thought Process: "I need to perform the same action (user creation) for every item in the array. A for loop is perfect for this. I'll use "${IAM_USER_NAMES[@]}" to get all elements in the array. It's crucial to add error checking (if [ $? -eq 0 ]) after each AWS CLI command to make the script robust and provide clear feedback to the user if something goes wrong (e.g., if a user already exists)."

## Step 3: Create the 'admin' IAM Group

We need to fill in the first part of the **create_admin_group** function. The AWS CLI command is **aws iam create-group --group-name admin**.

Action: Use the **create-group command**. The script already has a check to see if the group exists **(aws iam get-group)**, which is good for idempotency (running the script multiple times without errors).

Code (to replace the first echo statement in the function):

```bash
create_admin_group() {
    echo "Creating admin group and attaching policy..."
    echo "--------------------------------------------"

    # Check if group already exists
    aws iam get-group --group-name "admin" >/dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo "Admin group does not exist. Creating it now..."
        aws iam create-group --group-name "admin"
        if [ $? -eq 0 ]; then
            echo "Success: Admin group created."
        else
            echo "Error: Failed to create admin group." >&2
            exit 1 # Exit the script if group creation fails, as the next steps depend on it.
        fi
    else
        echo "Info: Admin group already exists. Skipping creation."
    fi
    ...
}
```

Thought Process: "The provided get-group command is a clever way to check for the group's existence. If the command fails (exit code $? is not 0, hence -ne 0), it means the group wasn't found, so we should create it. If it succeeds, we skip creation. This makes the script safe to run multiple times. If the group creation fails, it's a critical error, so we should exit the script entirely."

## Step 4: Attach the AdministratorAccess Policy to the Group

Now we need to attach the policy. The AWS CLI command is **aws iam attach-group-policy --policy-arn <policy-arn> --group-name <group-name>**.

The ARN for the managed **AdministratorAccess** policy is always **arn:aws:iam::aws:policy/AdministratorAccess**.

Action: Replace the second echo statement with the **attach-group-policy** command.

Code (to replace the second echo statement in the function):

```bash
    # Attach AdministratorAccess policy
    echo "Attaching AdministratorAccess policy..."
    aws iam attach-group-policy --policy-arn "arn:aws:iam::aws:policy/AdministratorAccess" --group-name "admin"

    if [ $? -eq 0 ]; then
        echo "Success: AdministratorAccess policy attached"
    else
        echo "Error: Failed to attach AdministratorAccess policy" >&2
        exit 1 # This is also a critical failure.
    fi
```

Thought Process: "I need the exact ARN for the policy. AWS managed policies have a standard ARN format. The command might fail if the policy doesn't exist (unlikely for AdministratorAccess) or due to permission issues. The error check will catch this. Again, this is a critical step, so a failure should stop the script."

## Step 5: Add Users to the 'admin' Group

Finally, we need to fill in the **add_users_to_admin_group** function. The AWS CLI command is **aws iam add-user-to-group --user-name <username> --group-name admin**.

Action: Just like in Step 2, we loop through the **IAM_USER_NAMES** array and perform the **add-user-to-group** action for each user.

Code (to replace the echo statement in the function):

```bash
add_users_to_admin_group() {
    echo "Adding users to admin group..."
    echo "------------------------------"

    for USER_NAME in "${IAM_USER_NAMES[@]}"; do
        echo "Adding user $USER_NAME to admin group..."
        aws iam add-user-to-group --user-name "$USER_NAME" --group-name "admin"
        if [ $? -eq 0 ]; then
            echo "Success: User $USER_NAME added to admin group."
        else
            echo "Error: Failed to add user $USER_NAME to admin group." >&2
        fi
        echo "" # Adds a blank line for readability
    done

    echo "----------------------------------------"
    echo "User group assignment process completed."
    echo ""
}
```

Thought Process: "This is very similar to the user creation loop. We reuse the same array and the same looping logic. This consistency makes the script easy to understand. The error check here is important but perhaps not critical enough to stop the entire script—maybe one user fails but the others can still be added, so we log the error and continue."

## Final, Complete Script

```bash
#!/bin/bash

# AWS IAM Manager Script for CloudOps Solutions
# This script automates the creation of IAM users, groups, and permissions

# Define IAM User Names Array
IAM_USER_NAMES=("devops-user1" "devops-user2" "devops-user3" "devops-user4" "devops-user5")

# Function to create IAM users
create_iam_users() {
    echo "Starting IAM user creation process..."
    echo "-------------------------------------"

    for USER_NAME in "${IAM_USER_NAMES[@]}"; do
        echo "Creating IAM user: $USER_NAME"
        aws iam create-user --user-name "$USER_NAME"
        if [ $? -eq 0 ]; then
            echo "Success: User $USER_NAME created."
        else
            echo "Error: Failed to create user $USER_NAME. It might already exist."
        fi
        echo ""
    done

    echo "------------------------------------"
    echo "IAM user creation process completed."
    echo ""
}

# Function to create admin group and attach policy
create_admin_group() {
    echo "Creating admin group and attaching policy..."
    echo "--------------------------------------------"

    # Check if group already exists
    aws iam get-group --group-name "admin" >/dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo "Admin group does not exist. Creating it now..."
        aws iam create-group --group-name "admin"
        if [ $? -eq 0 ]; then
            echo "Success: Admin group created."
        else
            echo "Error: Failed to create admin group." >&2
            exit 1
        fi
    else
        echo "Info: Admin group already exists. Skipping creation."
    fi

    # Attach AdministratorAccess policy
    echo "Attaching AdministratorAccess policy..."
    aws iam attach-group-policy --policy-arn "arn:aws:iam::aws:policy/AdministratorAccess" --group-name "admin"

    if [ $? -eq 0 ]; then
        echo "Success: AdministratorAccess policy attached"
    else
        echo "Error: Failed to attach AdministratorAccess policy" >&2
        exit 1
    fi

    echo "----------------------------------"
    echo ""
}

# Function to add users to admin group
add_users_to_admin_group() {
    echo "Adding users to admin group..."
    echo "------------------------------"

    for USER_NAME in "${IAM_USER_NAMES[@]}"; do
        echo "Adding user $USER_NAME to admin group..."
        aws iam add-user-to-group --user-name "$USER_NAME" --group-name "admin"
        if [ $? -eq 0 ]; then
            echo "Success: User $USER_NAME added to admin group."
        else
            echo "Error: Failed to add user $USER_NAME to admin group." >&2
        fi
        echo ""
    done

    echo "----------------------------------------"
    echo "User group assignment process completed."
    echo ""
}

# Main execution function
main() {
    echo "=================================="
    echo " AWS IAM Management Script"
    echo "=================================="
    echo ""

    # Verify AWS CLI is installed and configured
    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed. Please install and configure it first."
        exit 1
    fi

    # Execute the functions
    create_iam_users
    create_admin_group
    add_users_to_admin_group

    echo "=================================="
    echo " AWS IAM Management Completed"
    echo "=================================="
}

# Execute main function
main

exit 0
```

## Comprehensive Documentation of Thought Process

1. Understanding the Requirements & Design Philosophy:
My first step was to thoroughly read the project brief and objectives. The goal was clear: automate the onboarding of DevOps users with admin privileges. I focused on writing a script that is:

- Idempotent: It can be run multiple times without causing errors (e.g., checking if a user/group exists before creating it).
- Robust: It includes error checking after every major AWS CLI command to handle failures gracefully and provide clear feedback.
- Maintainable: It uses variables and arrays so that changes (like adding a new user) only need to be made in one place.
- Readable: It includes plenty of echo statements to log its progress to the terminal, making it clear what is happening at each stage.

## 2. Breaking Down the Problem:

I decomposed the project into the five core objectives. I realized objectives 2, 3, and 5 were single actions that needed to be performed in a loop or with a check. Using an array for the usernames was the key to connecting objectives 1, 2, and 5.

3. Implementation Strategy for Each Function:

- create_iam_users: The logic was straightforward: iterate and create. The main consideration was error handling for existing users. Instead of the script failing, it should warn the user and continue, which is achieved by checking the exit code ($?).
- create_admin_group: This was the most complex function. The provided get-group check was the right approach. My thought process was: "If the group is not found (get-group fails), then create it. If creation fails, that's a show-stopping error." Attaching the policy is a critical step that must be confirmed.
- add_users_to_admin_group: This mirrored the user creation function. The loop ensures all users are processed. An error adding one user shouldn't prevent others from being added, so it logs the error but doesn't exit.

4. Security and Best Practices Consideration:

- While the script assigns AdministratorAccess, in a real-world scenario, I would consider if a more granular custom policy adhering to the Principle of Least Privilege would be better. The script could be easily modified to accept a policy ARN as a variable.
- The script assumes the AWS CLI is configured with sufficient permissions. A future enhancement could be to check for specific IAM permissions at the start using aws iam simulate-principal-policy.

5. Potential Enhancements (Beyond the Scope):

- Programmatic Access Keys: The script could generate and securely output access keys for each user.
- Custom Password & Login Profile: It could create a login profile for each user with a temporary password that must be changed on first login.
- Input Parameters: Using command-line flags or a configuration file to specify usernames, group name, and policy ARN would make the script much more flexible and reusable for other teams (e.g., --group-name developers --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess).

## Final Thought: 

This script successfully automates a repetitive AWS administrative task, saving time and reducing the potential for human error. The structure and error handling make it a solid foundation that can be extended for more complex IAM management workflows in the future.
