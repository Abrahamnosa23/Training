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
