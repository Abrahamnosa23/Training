
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
