# Step-by-Step Guide: AWS S3 Bucket Creation with Error Handling

## Project Overview

This project teaches error handling in shell scripting by creating AWS S3 buckets for different departments while:
* Preventing duplicate bucket creation
* Implementing conditional checks
* Providing meaningful user feedback

## Learning Objectives

* Implement conditional error checks
* Use AWS CLI in shell scripts
* Prevent redundant resource creation
* Follow POSIX-compliant scripting practices 

## File Structure

s3_bucket_creator/
- ├── Screenshot # Contain Screenshot of the steps taken
- ├── s3_bucket_creator.sh # Main script
- └── README.md # Documentation

## Step-by-Step Implementation

### Prerequisites

#### Install AWS CLI and configure credentials:

```bash
aws configure
```

![Screenshot 2025-07-05 185405](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Screenshot%202025-07-05%20185405.png)

#### Verify access:

```bash
aws sts get-caller-identity
```

![Screenshot 2025-07-05 185532](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Screenshot%202025-07-05%20185532.png)

#### Create the Script File

```bash
vim s3_bucket_creator.sh
```

![Capture](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Capture.PNG)

![Screenshot 2025-07-02 213225](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Screenshot%202025-07-02%20213225.png)

#### Add the Script Content

```bash
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
```
[s3_bucket_creator.sh](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/s3_bucket_creator.sh)

![Capture3](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Capture3.PNG)

#### Make the Script Executable

```bash
chmod +x s3_bucket_creator.sh
```

![Screenshot 2025-07-02 213245](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Screenshot%202025-07-02%20213245.png)

#### Run the Script

```bash
./s3_bucket_creator.sh
```

![Screenshot 2025-07-02 213947](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Screenshot%202025-07-02%20213947.png)

#### Expected Output

```bash
S3 bucket 'datamiss-Marketing-Data-Bucket' created successfully.
S3 bucket 'datamiss-Sales-Data-Bucket' already exists. Skipping creation.
...
```

![Screenshot 2025-07-05 181703](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Screenshot%202025-07-05%20181703.png)

![Capture4](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Capture4.PNG)


#### Verification

```bash
aws s3 ls  # List all buckets to verify creation
```

![Capture5](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Capture8.PNG)

## Key Features

### Duplicate Prevention

```bash
if aws s3api head-bucket --bucket "$bucket_name" &>/dev/null; then
    echo "Bucket exists - skipping"
fi
```

![Screenshot 2025-07-05 185329](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Screenshot%202025-07-05%20185329.png)

### Error Handling

| Error Case         | Handling Method      |
|:-------------------|:--------------------:|
| Bucket exists	     | Skip creation        |
| AWS API failure	 | Exit with status 1   |
| Permission issues	 | STDERR messaging     |

### Departmental Buckets

#### Automatically creates buckets for:

* Marketing
* Sales
* HR
* Operations
* Media

### Testing

```bash
# First run (creates buckets)
./s3_bucket_creator.sh

# Second run (skips existing)
./s3_bucket_creator.sh | grep "already exists"
```

![Screenshot 2025-07-05 185329](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Error%20Handling%20in%20Shell%20Scripting/Screenshots/Screenshot%202025-07-05%20185329.png)

## License

MIT License - Free for commercial and educational use
