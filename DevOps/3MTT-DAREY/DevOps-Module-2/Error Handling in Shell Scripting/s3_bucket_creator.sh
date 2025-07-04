#!/bin/bash

# Function to create S3 buckets with error handling
create_s3_buckets() {
    company="datamiss"
    departments=("Marketing" "Sales" "HR" "Operations" "Media")
    region="us-east-1"  # Change this as needed

    for department in "${departments[@]}"; do
        bucket_name="${company,,}-${department,,}-data-bucket"  # Lowercase bucket name

        # Check if bucket exists
        if aws s3api head-bucket --bucket "$bucket_name" 2>/dev/null; then
            echo "S3 bucket '$bucket_name' already exists. Skipping creation."
        else
            echo "Creating S3 bucket '$bucket_name'..."

            # Conditional bucket creation depending on region
            if [ "$region" = "us-east-1" ]; then
                aws s3api create-bucket --bucket "$bucket_name" --region "$region"
            else
                aws s3api create-bucket \
                    --bucket "$bucket_name" \
                    --region "$region" \
                    --create-bucket-configuration LocationConstraint="$region"
            fi

            if [ $? -eq 0 ]; then
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
