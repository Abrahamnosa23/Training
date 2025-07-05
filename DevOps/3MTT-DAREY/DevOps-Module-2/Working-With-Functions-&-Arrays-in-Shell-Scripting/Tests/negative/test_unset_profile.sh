#!/bin/bash
# Test unset AWS profile handling

unset AWS_PROFILE
../aws_environment_setup.sh testing 2>&1 | grep -q "AWS profile environment variable is not set"

if [ $? -eq 0 ]; then
    echo "PASS: Detected unset AWS profile"
else
    echo "FAIL: Did not catch unset AWS profile"
    exit 1
fi
