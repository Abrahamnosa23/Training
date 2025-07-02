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
![Screenshot 2025-07-02 120628](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%201/Screenshot%202025-07-02%20120628.png)

![Screenshot 2025-07-02 120742](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%201/Screenshot%202025-07-02%20120742.png)

![Screenshot 2025-07-02 121152](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%201/Screenshot%202025-07-02%20121152.png)

![Screenshot 2025-07-02 121216](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%201/Screenshot%202025-07-02%20121216.png)

![Screenshot 2025-07-02 121246](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%201/Screenshot%202025-07-02%20121246.png)

![Screenshot 2025-07-02 121301](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%201/Screenshot%202025-07-02%20121301.png)

![Screenshot 2025-07-02 121342](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%201/Screenshot%202025-07-02%20121342.png)


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

![Screenshot 2025-07-02 121719](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%202/Screenshot%202025-07-02%20121719.png)

![Screenshot 2025-07-02 121833](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%202/Screenshot%202025-07-02%20121833.png)

![Screenshot 2025-07-02 122106](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%202/Screenshot%202025-07-02%20122106.png)

![Screenshot 2025-07-02 122120](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%202/Screenshot%202025-07-02%20122120.png)

![Screenshot 2025-07-02 122148](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%202/Screenshot%202025-07-02%20122148.png)

![Screenshot 2025-07-02 122225](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%202/Screenshot%202025-07-02%20122225.png)

![Screenshot 2025-07-02 122344](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%202/Screenshot%202025-07-02%20122344.png)

![Screenshot 2025-07-02 122548](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%202/Screenshot%202025-07-02%20122548.png)

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

![Screenshot 2025-07-02 122737](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%203/Screenshot%202025-07-02%20122737.png)

![Screenshot 2025-07-02 122913](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%203/Screenshot%202025-07-02%20122913.png)

![Screenshot 2025-07-02 122944](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%203/Screenshot%202025-07-02%20122944.png)

![Screenshot 2025-07-02 123239](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%203/Screenshot%202025-07-02%20123239.png)

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

![Screenshot 2025-07-02 123325](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%204/Screenshot%202025-07-02%20123325.png)

![Screenshot 2025-07-02 123606](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%204/Screenshot%202025-07-02%20123606.png)

![Screenshot 2025-07-02 123711](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Control-Flows)/Screenshots/task%204/Screenshot%202025-07-02%20123711.png)


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
