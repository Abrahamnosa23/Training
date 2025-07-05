#!/bin/bash
# Execute all test cases
"positive/test_local.sh"
    "positive/test_production.sh"
    "negative/test_invalid_env.sh"
    "negative/test_missing_arg.sh"
    "negative/test_no_aws_cli.sh"      # Added
    "negative/test_unset_profile.sh"   # Added
)

for test in "${test_scripts[@]}"; do
    echo "=== Running $test ==="
    ./$test || exit 1
    echo "--- PASSED ---\n"
done

echo "✅ All tests passed successfully"
