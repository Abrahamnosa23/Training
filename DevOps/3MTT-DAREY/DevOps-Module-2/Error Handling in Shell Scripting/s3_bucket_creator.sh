#!/bin/bash

# Function to create S3 buckets with error handling
create_s3_buckets() {
    company="datamiss"
    departments=("Marketing" "Sales" "HR" "Operations" "Media")
    region="us-east-1"  # Replace with your region

    for department in "${departments[@]}"; do
        bucket_name="${company}-${department}-Data-Bucket"

        # Check if bucket exists
        if aws s3api head-bucket --bucket "$bucket_name" &>/dev/null; then
            echo "S3 bucket '$bucket_name' already exists. Skipping creation."
        else
            # Create bucket if it doesn't exist
            if aws s3api create-bucket --bucket "$bucket_name" --region "$region"; then
                echo "S3 bucket '$bucket_name' created successfully."
            else
                echo "ERROR: Failed to create S3 bucket '$bucket_name'." >&2
                exit 1
            fi
        fi
    done
}

# Execute the function
create_s3_buckets
