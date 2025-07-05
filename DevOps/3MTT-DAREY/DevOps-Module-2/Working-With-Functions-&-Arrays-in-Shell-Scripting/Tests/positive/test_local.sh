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
