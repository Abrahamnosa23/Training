#!/bin/bash
# Test missing argument handling
../aws_environment_setup.sh 2>&1 | grep -q "Usage:"

if [ $? -eq 0 ]; then
    echo "PASS: Missing argument detected"
else
    echo "FAIL: Did not catch missing argument"
    exit 1
fi
