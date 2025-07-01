
# Linux Shell Scripting: Commenting Best Practices

## Project Overview
This project focuses on effective commenting in Bash scripts, a crucial skill for writing readable, maintainable, and collaborative shell scripts. You will learn:
* Single-line and multi-line commenting techniques
* Best practices for clear and useful comments
* How comments improve script documentation and team collaboration

## Step-by-Step Implementation
* Create a New Script File

```bash
vim commenting_practices.sh
```

![{2C54BC7E-ED37-49E0-B275-2811ACE9DA98}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Comments)/Screenshot/%7B2C54BC7E-ED37-49E0-B275-2811ACE9DA98%7D.png)

* Add the Following Code with Comments
```bash
#!/bin/bash

# =============================================
# SCRIPT: commenting_practices.sh
# DESCRIPTION: Demonstrates best practices for 
#              adding comments in Bash scripts
# AUTHOR: [Your Name]
# DATE: $(date)
# =============================================

# --- SINGLE-LINE COMMENTS ---
# This is a single-line comment (starts with #)
echo "Hello, welcome to Bash scripting!"  # Inline comment after code

# --- MULTI-LINE COMMENTS ---
# This is one way to write
# multi-line comments by prefixing
# each line with a # symbol.

: '
This is another method for multi-line comments
using the : operator and single quotes.
Works well for longer documentation blocks.
'

# --- BEST PRACTICES DEMO ---

# Clear explanation of the script's purpose
# This script creates a backup of /var/log files
# and compresses them into a timestamped archive.

backup_dir="/backup/logs"
mkdir -p "$backup_dir"  # Create dir if it doesn't exist

# Compress logs (verbose output for clarity)
echo "Starting log backup process..."  # Status update
tar -czvf "${backup_dir}/logs_$(date +%F).tar.gz" /var/log/*
```
![{77245D0F-EF6B-4B1C-AB36-2BDB201E167C}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Comments)/Screenshot/%7B77245D0F-EF6B-4B1C-AB36-2BDB201E167C%7D.png)

* Make the Script Executable
```bash
chmod +x commenting_practices.sh
```
![{778931D8-44D3-4FC2-8831-890F91235A87}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Comments)/Screenshot/%7B778931D8-44D3-4FC2-8831-890F91235A87%7D.png)

* Run the Script
```bash
./commenting_practices.sh
```
![{E1615B95-ED52-4154-9C5E-11CA3E9A947B}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Comments)/Screenshot/%7BE1615B95-ED52-4154-9C5E-11CA3E9A947B%7D.png)

![{645FE650-36C8-4E3C-9C81-81B4F7AE7B7B}](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/DevOps-Module-2/Linux-Shell-Scripting-(Comments)/Screenshot/%7B645FE650-36C8-4E3C-9C81-81B4F7AE7B7B%7D.png)

## Best Practices
* Explain WHY, not just WHAT
* Update comments when modifying code
* Avoid redundant comments on self-explanatory code
* Use consistent formatting (e.g., headers with ===)

## Expected Output

Hello, welcome to Bash scripting!
Starting log backup process...
/var/log/alternatives.log
/var/log/auth.log
...
Backup saved to /backup/logs/logs_2025-07-01.tar.gz

## File Structure

shell-scripting/
├── commenting_practices.sh
└── README.md

## Why This Matters
Readability: Comments help others (and your future self) understand the script.

Maintainability: Well-documented scripts are easier to debug and update.

Collaboration: Essential for team projects where multiple people work on the same codebase.

## Pro Tip

Use tools like shellcheck to validate scripts and include findings in comments!
