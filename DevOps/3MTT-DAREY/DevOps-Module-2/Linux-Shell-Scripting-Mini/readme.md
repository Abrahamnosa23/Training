
# Linux Shell Scripting Automation Project

## Project Overview
This project demonstrates the fundamentals of Linux shell scripting by automating the creation of directories and user accounts on an Ubuntu server. The script utilizes Bash scripting best practices, including:

- Shebang (#!/bin/bash) for interpreter specification
- Variable usage for dynamic scripting
- File permissions (chmod) for script execution
- Basic Linux commands (mkdir, useradd, ls, id)

## Objectives
- Automate folder and user creation
- Understand shell script permissions and execution
- Learn variable usage in Bash scripting
- Gain hands-on experience with Linux system administration

## Step-by-Step Implementation

- Set Up the Project Directory

```bash
mkdir shell-scripting && cd shell-scripting
```
![Screenshot 2025-06-19 215703](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/Screenshot%202025-06-19%20215703.png)
![Screenshot 2025-06-19 215727](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/Screenshot%202025-06-19%20215727.png)
![Screenshot 2025-06-19 215902](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/Screenshot%202025-06-19%20215902.png)
- Create the Shell Script
Using vim (or nano), create a file:

```bash
vim shell_script.sh
```

![{DE782623-73E6-4222-9920-F2267640A419}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/%7BDE782623-73E6-4222-9920-F2267640A419%7D.png)

- Insert the Script Code

```bash
#!/bin/bash

## Create directories
mkdir Folder1
mkdir Folder2
mkdir Folder3

## Create users (requires sudo)
sudo useradd user1
sudo useradd user2
sudo useradd user3

## Print confirmation
echo "Directories and users created successfully!"
```
![{043BFC48-20B3-4331-99C4-1CB9BD523EE3}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/%7B043BFC48-20B3-4331-99C4-1CB9BD523EE3%7D.png)
![{598D656C-6197-4EA1-AC70-BC703CCBECF9}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/%7B598D656C-6197-4EA1-AC70-BC703CCBECF9%7D.png)
![{D8F651D1-7F95-4BB7-AAAF-0E82101750BF}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/%7BD8F651D1-7F95-4BB7-AAAF-0E82101750BF%7D.png)

Save and exit (:wq in vim).

- Check File Permissions

```bash
ls -lstr
```

![{07B59E6B-8ACA-4D5F-B5B7-453DF3E4DA0A}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/%7B07B59E6B-8ACA-4D5F-B5B7-453DF3E4DA0A%7D.png)

Expected output: -rw-r--r-- (no execute permission)

- Make the Script Executable

```bash
chmod u+x shell_script.sh
```
![{FE7A3F53-9CDD-4385-A646-7BEF5549C71A}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/%7BFE7A3F53-9CDD-4385-A646-7BEF5549C71A%7D.png)
![{E26F839D-CAF4-4A88-A475-C700429905A4}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-Mini/Screenshots/%7BE26F839D-CAF4-4A88-A475-C700429905A4%7D.png)
![{48CED7B4-3AE6-4EA6-A3FC-33EE49B7F845}](


Verify with ls -lstr → Should now show -rwxr--r--

- Execute the Script

```bash
./shell_script.sh
```
Enter sudo password if prompted.

- Verify Output
Check folders:

```bash
ls
```
Check users:

```bash
id user1
id user2
id user3
```
Expected output:

uid=1001(user1) gid=1001(user1) groups=1001(user1)

## Advanced: Using Variables
To make the script more dynamic, modify it to use variables:

```bash
#!/bin/bash

## Define variables
username="admin"
folder_prefix="data"

## Create directories
mkdir ${folder_prefix}_1 ${folder_prefix}_2 ${folder_prefix}_3

## Create users
sudo useradd ${username}_1
sudo useradd ${username}_2
sudo useradd ${username}_3

## Print confirmation
echo "Created folders: $(ls | grep ${folder_prefix})"
echo "Created users: $(id ${username}_1) $(id ${username}_2) $(id ${username}_3)"
```

## Key Learnings
- Shebang (#!/bin/bash) – Specifies the interpreter.
- File Permissions (chmod) – Ensures script executability.
- Basic Commands (mkdir, useradd) – Automates system tasks.
- Variables (name="John") – Enhances script flexibility.

## Cleanup (Optional)
To remove created folders and users:

```bash
rm -r Folder1 Folder2 Folder3
sudo userdel user1 user2 user3
```

## Professional Best Practices
- Use comments (#) to explain script logic.
- Always check permissions before executing scripts.
- Test scripts in a safe environment before production use.
- Use sudo cautiously – Only when necessary.

## Conclusion
This project provides a hands-on introduction to Linux shell scripting, covering automation, permissions, and basic system administration. By following these steps, you’ve built a functional script that can be expanded for more complex tasks.

## File Structure

text
shell-scripting/

└── my_first_shell_script.sh
