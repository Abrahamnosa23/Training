# AWS Environment Setup with Shell Scripting Functions

![AWS CLI](https://img.icons8.com/color/48/000000/amazon-web-services.png)

## Project Overview

### This project teaches modular shell scripting by creating functions to:
- Validate AWS CLI installation
- Check environment variables
- Handle different AWS environments
- Implement professional error handling

### This script automates AWS environment setup with:
- Environment validation (local/testing/production)
- Dependency checking (AWS CLI)
- Configuration verification (profile/credentials)
- Robust error handling

## File Structure

[Screenshot](https://github.com/Abrahamnosa23/Training/tree/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot)

[Readme.md](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Readme.md)

[aws_environment_setup.sh](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/aws_environment_setup.sh)

[.github/workflow](https://github.com/Abrahamnosa23/Training/tree/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/.github/workflows)

[tests](https://github.com/Abrahamnosa23/Training/tree/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Tests)

<pre> Working-With-Functions-&-Arrays-in-Shell-Scripting/
├── Screenshot                      # Project documentation
├── README.md                       # Project documentation
├── aws_environment_setup.sh        # Main script
├── .github/
│   └── workflows/
│       └── ci.yml                  # CI/CD pipeline configuration
└── tests/
    ├── run_all_tests.sh            # Test runner script
    ├── positive/                   # Successful scenario tests
    │   ├── test_local.sh           # Local environment tests
    │   └── test_production.sh      # Production environment tests  
    └── negative/                   # Error scenario tests
        ├── test_invalid_env.sh     # Invalid environment tests
        ├── test_missing_arg.sh     # Missing argument tests
        └── test_no_aws_cli.sh      # Missing AWS CLI tests
</pre>

## Key File Explanations:

- Root Files:
  - aws_environment_setup.sh: Main script with all environment setup functions
  - README.md: Project documentation with usage instructions

- Test Structure:
  - run_all_tests.sh: Master script to execute all test cases
  - positive/: Tests for valid environment configurations
  - negative/: Tests for error handling scenarios

- CI/CD Integration:
  - ci.yml: GitHub Actions workflow for automated testing
- Test Coverage:
  -  Local vs production environment differences
  - Argument validation
  - AWS CLI installation check
  - Profile configuration validation


## Step-by-Step Implementation

### Create Script File
```bash
vim aws_environment_setup.sh
```
![Screenshot 2025-07-06 003207](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20003207.png)

### Add This Corrected & Improved Script
```bash
#!/bin/bash

# ========== FUNCTION DEFINITIONS ==========

# Check argument count
check_num_of_args() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        echo "Valid environments: local, testing, production"
        exit 1
    fi
}

# Activate environment configuration
activate_environment() {
    case "$1" in
        local)
            echo "Configuring LOCAL environment..."
            export AWS_PROFILE="default"
            ;;
        testing)
            echo "Configuring TESTING environment..."
            export AWS_PROFILE="testing"
            ;;
        production)
            echo "Configuring PRODUCTION environment..."
            export AWS_PROFILE="production"
            ;;
        *)
            echo "ERROR: Invalid environment '$1'"
            echo "Valid options: local, testing, production"
            exit 2
            ;;
    esac
}

# Verify AWS CLI installation
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "ERROR: AWS CLI not found. Please install it first."
        exit 3
    fi
}

# Check AWS profile configuration
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "ERROR: AWS_PROFILE environment variable not set"
        exit 4
    fi
    
    if ! aws configure list-profiles | grep -q "$AWS_PROFILE"; then
        echo "ERROR: AWS profile '$AWS_PROFILE' not configured"
        exit 5
    fi
}

# ========== MAIN EXECUTION ==========
check_num_of_args "$@"
activate_environment "$1"
check_aws_cli
check_aws_profile

echo "SUCCESS: AWS environment '$1' configured properly"
aws configure list
```

![Screenshot 2025-07-06 004944](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20004944.png)

![Screenshot 2025-07-06 005011](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20005011.png)

![Screenshot 2025-07-06 005029](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20005029.png)

![Screenshot 2025-07-06 190626](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20190626.png)

![Screenshot 2025-07-06 191305](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20191305.png)



### Create Test Directory Structure
```bash
mkdir -p tests/{positive,negative} && cd tests
```

![Screenshot 2025-07-06 191526](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20191526.png)

![Screenshot 2025-07-06 005412](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20005412.png)

![Screenshot 2025-07-06 005426](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20005426.png)


### Positive Test Cases
- tests/positive/test_local.sh
```bash
#!/bin/bash
# Test LOCAL environment configuration
../aws_environment_setup.sh local > /dev/null

if [ $? -eq 0 ]; then
    echo "PASS: Local environment configured successfully"
else
    echo "FAIL: Local environment test"
    exit 1
fi

# Verify AWS_PROFILE set correctly
if [ "$AWS_PROFILE" == "default" ]; then
    echo "PASS: Correct profile (default) loaded"
else
    echo "FAIL: Incorrect profile loaded"
    exit 1
fi
```

![Screenshot 2025-07-06 191833](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20191833.png)

![Screenshot 2025-07-06 200735](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20200735.png)

![Screenshot 2025-07-06 014951](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20014951.png)

- tests/positive/test_production.sh
```bash
#!/bin/bash
# Test PRODUCTION environment configuration
../aws_environment_setup.sh production > /dev/null

if [ $? -eq 0 ]; then
    echo "PASS: Production environment configured successfully"
else
    echo "FAIL: Production environment test"
    exit 1
fi

# Verify critical production safeguards
if aws configure get region --profile production | grep -q "us-west-2"; then
    echo "PASS: Production region validation"
else
    echo "FAIL: Incorrect production region"
    exit 1
fi
```

![Screenshot 2025-07-06 202001](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20202001.png)

![Screenshot 2025-07-06 201940](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20201940.png)

![Screenshot 2025-07-06 020744](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20020744.png)

![Screenshot 2025-07-06 021512](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20021512.png)

### Negative Test Cases
- tests/negative/test_invalid_env.sh
```bash
#!/bin/bash
# Test invalid environment handling
../aws_environment_setup.sh staging 2>&1 | grep -q "Invalid environment"

if [ $? -eq 0 ]; then
    echo "PASS: Invalid environment detected"
else
    echo "FAIL: Did not catch invalid environment"
    exit 1
fi
```

![Screenshot 2025-07-06 204620](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20204620.png)

![Screenshot 2025-07-06 204602](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20204602.png)

- tests/negative/test_missing_arg.sh
```bash
#!/bin/bash
# Test missing argument handling
../aws_environment_setup.sh 2>&1 | grep -q "Usage:"

if [ $? -eq 0 ]; then
    echo "PASS: Missing argument detected"
else
    echo "FAIL: Did not catch missing argument"
    exit 1
fi
```

![Screenshot 2025-07-06 204642](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20204642.png)

![Screenshot 2025-07-06 205131](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20205131.png)

### Test Runner Script
- tests/run_all_tests.sh
```bash
#!/bin/bash
# Execute all test cases
declare -a test_scripts=(
    "positive/test_local.sh"
    "positive/test_production.sh"
    "negative/test_invalid_env.sh"
    "negative/test_missing_arg.sh"
)

for test in "${test_scripts[@]}"; do
    echo "Running $test..."
    ./$test || exit 1
done

echo "All tests passed successfully"
```

![Screenshot 2025-07-06 205609](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20205609.png)

![Screenshot 2025-07-06 205555](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20205555.png)

## Test Suite

### Test Cases Overview

| Test File | Purpose | Expected Outcome |
|-----------|---------|------------------|
| `test_local.sh` | Verify local environment config | Sets `AWS_PROFILE=default` |
| `test_production.sh` | Validate production safeguards | Confirms us-west-2 region |
| `test_invalid_env.sh` | Error handling for bad input | Returns error code 2 |
| `test_missing_arg.sh` | Argument validation | Shows usage instructions |

### Make Executable 
```bash
chmod +x aws_environment_setup.sh
```

![Screenshot 2025-07-06 205652](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20205652.png)

![Screenshot 2025-07-06 205705](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20205705.png)

### Run Test
```bash
./aws_environment_setup.sh testing
./aws_environment_setup.sh production
./aws_environment_setup.sh invalid
```

![Screenshot 2025-07-06 213901](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20213901.png)

## Key Testing Concepts Demonstrated
- Positive Testing = Valid environment configurations
- Negative Testing = Error condition validation
- Exit Code Verification = Confirming proper error signaling
- Output Validation = Checking stdout/stderr messages
- Integration Testing = End-to-end workflow verification

## CI/CD Integration Example

- Yaml File
```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: |
          sudo apt-get install -y awscli
          cd tests && ./run_all_tests.sh
```

![Screenshot 2025-07-06 210243](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20210243.png)

![Screenshot 2025-07-06 210319](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Working-With-Functions-%26-Arrays-in-Shell-Scripting/Screenshot/Screenshot%202025-07-06%20210319.png)

## Summary of your key learnings

Through this project, you've mastered modular shell scripting by creating specialized functions to handle AWS environment configurations, including argument validation, AWS CLI verification, and profile       authentication. You learned to implement professional error handling with exit codes, use environment variables for AWS profile switching, and structure scripts with clear function boundaries for maintainability. The project demonstrated practical applications of conditional logic (case statements), command output checking (command -v), and defensive programming techniques. You also gained experience with AWS CLI configuration files, profile management, and best practices for writing production-ready shell scripts that validate all dependencies and inputs before execution, ensuring reliable infrastructure automation.


## License
Apache 2.0 - Open for commercial use with attribution




