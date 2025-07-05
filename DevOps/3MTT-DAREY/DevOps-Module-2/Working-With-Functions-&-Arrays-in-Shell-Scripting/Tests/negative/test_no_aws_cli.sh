
#!/bin/bash
# Test AWS CLI dependency check

# Simulate missing AWS CLI
original_path="$PATH"
PATH="/usr/bin:/bin"

../aws_environment_setup.sh local 2>&1 | grep -q "AWS CLI not found"

if [ $? -eq 0 ]; then
    echo "PASS: Detected missing AWS CLI"
else
    echo "FAIL: Did not catch missing AWS CLI"
    exit 1
fi

# Restore PATH
PATH="$original_path"
