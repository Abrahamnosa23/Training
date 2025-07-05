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
