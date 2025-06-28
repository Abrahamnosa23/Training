
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
!
- Create the Shell Script
Using vim (or nano), create a file:

```bash
vim shell_script.sh
```

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

Save and exit (:wq in vim).

- Check File Permissions

```bash
ls -lstr
```
Expected output: -rw-r--r-- (no execute permission)

- Make the Script Executable

```bash
chmod u+x my_first_shell_script.sh
```
Verify with ls -lstr → Should now show -rwxr--r--

- Execute the Script

```bash
./my_first_shell_script.sh
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
