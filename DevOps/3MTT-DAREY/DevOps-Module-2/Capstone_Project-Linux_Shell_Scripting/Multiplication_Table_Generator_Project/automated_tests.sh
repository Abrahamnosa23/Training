```bash
# Verify full table generation
./multitable.sh <<< $'5\n1\nn' | grep "5 x 10 = 50" || echo "Test failed"

# Test error handling
./multitable.sh <<< $'abc\n5\n1\nn' | grep "Error" || echo "Test failed"
```
