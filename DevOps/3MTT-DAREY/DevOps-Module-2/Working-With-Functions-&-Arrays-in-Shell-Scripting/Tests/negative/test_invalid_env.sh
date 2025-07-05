#!/bin/bash
# Test invalid environment handling
../aws_environment_setup.sh staging 2>&1 | grep -q "Invalid environment"

if [ $? -eq 0 ]; then
    echo "PASS: Invalid environment detected"
else
    echo "FAIL: Did not catch invalid environment"
    exit 1
fi
