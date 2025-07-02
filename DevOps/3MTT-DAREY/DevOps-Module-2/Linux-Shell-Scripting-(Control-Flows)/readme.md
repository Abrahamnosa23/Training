# Step-by-Step Guide: Linux Shell Scripting Control Flows Project

![Bash Logo](https://img.icons8.com/color/48/000000/bash.png)

## Project Overview

This project teaches control flow structures in Bash scripting, focusing on:

* Conditional statements (if-elif-else)
* Loop structures (for, while, until)
* User input handling (read -p)
* Numerical comparisons (-gt, -lt, -eq)

## Step-by-Step Implementation

### Set Up Project Directory
```bash
mkdir control_flows_project && cd control_flows_project
```
#### Task 1: Conditional Statements (if-elif-else)

File: number_checker.sh
```bash
#!/bin/bash

read -p "Enter a number: " num

if [ $num -gt 0 ]; then
    echo "The number is positive."
elif [ $num -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is zero."
fi
```

Execute & Test:

```bash
chmod +x number_checker.sh
./number_checker.sh
# Test cases: 5 (positive), -3 (negative), 0 (zero)
```

#### Task 2: For Loops (Three Variations)

A. List Form
File: for_list.sh

```bash
#!/bin/bash
for i in 1 2 3 4 5; do
    echo "List iteration: $i"
done
```
B. Range Syntax
File: `for_range.sh**

```bash
#!/bin/bash
for i in {1..5}; do
    echo "Range iteration: $i"
done
```
C. C-style Form
File: `for_cstyle.sh**

```bash
#!/bin/bash
for (( i=0; i<5; i++ )); do
    echo "C-style iteration: $i"
done
```
Execute All:

```bash
chmod +x for_*.sh
./for_list.sh
./for_range.sh
./for_cstyle.sh
```

#### Task 3: While Loop (User Input)
File: `while_counter.sh**

```bash
#!/bin/bash
counter=1
while [ $counter -le 5 ]; do
    echo "While loop count: $counter"
    ((counter++))
done
```
Execute:

```bash
chmod +x while_counter.sh
./while_counter.sh
```

#### Advanced Task: Combined Example
File: `advanced_loops.sh**

```bash
#!/bin/bash
# Demonstrates nested control flows
for (( i=1; i<=3; i++ )); do
    echo "Outer loop iteration: $i"
    j=1
    while [ $j -le 2 ]; do
        echo "  Inner while iteration: $j"
        ((j++))
    done
done
```

#### Key Concepts Learned

Concept	Syntax Example	Use Case
if-elif-else	if [ $x -gt 0 ]; then ...	Decision making
For Loop (List)	for i in 1 2 3; do ...	Iterate over items
For Loop (C-style)	for ((i=0;i<5;i++)); do ...	Numerical control
While Loop	while [ $x -le 5 ]; do ...	Condition-based repetition

## Best Practices

* Use [[ ]] instead of [ ] for modern Bash scripts
* Always quote variables ("$var")
* Include shebang (#!/bin/bash)
* Add comments for complex logic

## License
MIT License - Free for educational use
