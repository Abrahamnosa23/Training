# Linux Commands Deep Dive

This project provides a comprehensive guide to Linux file system navigation, essential commands, and system administration tasks. Learn how to safely manipulate files and directories, use powerful system commands, and understand Linux permissions.


## 📌 Project Requirements Checklist

My submission covers:

1. Linux Command Syntax (Detailed breakdown of command -options parameters)
2. Filesystem Navigation (pwd, ls, cd, exploring /usr, /root)
3. File/Directory Manipulation (touch, cp, mv, rm, sudo mkdir)
4. Side Hustle Task 1 (Creating directories in /usr, documenting steps)
5. Real-World Examples (Practical use cases for each command)


## ✅ Grading Criteria Addressed  
| Requirement           | Covered?| Proof                                             |  
|-----------------------|---------|---------------------------------------------------|  
| Command Syntax        | ✅      |  [Section 1](#1-command-syntax-breakdown)        |  
| Filesystem Navigation | ✅      | [Section 2](#2-navigating-the-linux-filesystem)  |  
| File/Dir Manipulation | ✅      | [Section 3](#3-file--directory-manipulation)     |  
| Side Hustle Task 1    | ✅      | [Section 4](#4-side-hustle-task-1)               |  


## 📂 Project Structure
Basic-linux-commands-project/  
├── README.md                # Updated guide (see template below)  
├── screenshots/             # Terminal outputs for all tasks  
│   ├── side-hustle-task1/   # Proof of completing Task 1  
│   └── command-examples/    # `ls -la`, `sudo mkdir`, etc.  
└── troubleshooting.md       # Documented issues & fixes 


### 1. Command Syntax Breakdown  
#### General Structure 
```bash
# command -options parameters
* ls -la /home
  * ls: Command (list files)
  * -l: Option (long format)
  * -a: Option (show hidden files)
  * /home: Parameter (target directory)
```

![1. Screenshot 2025-05-15 204032.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/1.%20Screenshot%202025-05-15%20204032.png)

![2. Screenshot 2025-05-15 204141.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/2.%20Screenshot%202025-05-15%20204141.png)

#### Key Commands

|Command	|Syntax	|Example|
|-----------|------------|------------|
|ls	        |ls -[options] [dir]	|ls -la /usr|
|sudo       |sudo [command]	      |sudo mkdir /usr/photos|
|find       |find [path] -name "[file]"	  |find /home -name "*.txt"|


### 2. Navigating the Linux Filesystem

#### Task: Explore /usr and /root

1. List contents of /usr:
```bash
ls -l /usr  # Shows binaries, libraries, etc.
```

2. Navigate to /root (requires sudo)
```bash
sudo ls -l /root  # Superuser home directory
```

![3. Screenshot 2025-05-15 204336.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/3.%20Screenshot%202025-05-15%20204336.png)

### 3. File & Directory Manipulation

1. Create a Directory with sudo

```bash
sudo mkdir /usr/photos  # Requires admin rights
```

2. Copy/Move Files

```bash
cp file.txt /backup/      # Copy  
mv file.txt renamed.txt   # Rename
```

3. Delete Files (Caution!)

```bash
rm old_file.txt           # Single file  
rm -r /tmp/trash/        # Recursive delete (dangerous!)
```

![4. Screenshot 2025-05-15 204513.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/4.%20Screenshot%202025-05-15%20204513.png)

### 4. Side Hustle Task 1

#### Objective
Create /usr/pinker, subdirectories, and document steps.

#### Steps

1. Create photo in /usr:

```bash
sudo mkdir /usr/photo
```

2. Navigate and create subdirs:

```bash
cd /usr/photo  
mkdir myphoto1 myphoto2 myphoto3    # Create multiple dirs
```

3. Verify and show path:

```bash
ls                      # List contents  
pwd                     # Show full path (e.g., `/usr/pinker`)
```

![5. Screenshot 2025-05-15 204740.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/5.%20Screenshot%202025-05-15%20204740.png)

![6. Screenshot 2025-05-15 204752.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/6.%20Screenshot%202025-05-15%20204752.png)

![7. Screenshot 2025-05-15 204846.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/7.%20Screenshot%202025-05-15%20204846.png)

![8. Screenshot 2025-05-15 205129.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/8.%20Screenshot%202025-05-15%20205129.png)

![9. Screenshot 2025-05-15 205213.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/9.%20Screenshot%202025-05-15%20205213.png)

![10. Screenshot 2025-05-15 210443.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/10.%20Screenshot%202025-05-15%20210443.png)

![11. Screenshot 2025-05-15 210511.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/11.%20Screenshot%202025-05-15%20210511.png)

![12. Screenshot 2025-05-15 210659.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/12.%20Screenshot%202025-05-15%20210659.png)

![13. Screenshot 2025-05-15 210852.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/13.%20Screenshot%202025-05-15%20210852.png)

![14. Screenshot 2025-05-15 211022.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/14.%20Screenshot%202025-05-15%20211022.png)

![15. Screenshot 2025-05-15 211139.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/15.%20Screenshot%202025-05-15%20211139.png)

![16. Screenshot 2025-05-15 211211.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/16.%20Screenshot%202025-05-15%20211211.png)


### 5. Troubleshooting & Best Practices

#### Common Issues
- Permission Denied? Use sudo for system directories.
- Accidental Deletion? Avoid rm -rf / (destructive!).

#### Safety Tips
- Always double-check paths before deleting.
- Use -i with rm for confirmation:

```bash
rm -i file.txt  # Prompts before deleting
```


## 📌 Submission Checklist

### Before submitting:

1. Replace placeholder screenshots with actual terminal outputs.
2. Verify Side Hustle Task 1 is fully documented.
3. Add a "Lessons Learned" section reflecting on challenges.
   

## 🛡️ Security Best Practices

  1. Always double-check paths before running destructive commands
  2. Use -i (interactive) flag with rm/cp/mv for confirmation
  3. Limit sudo usage - only when absolutely necessary
  4. Backup important files before bulk operations
  5. Use tab completion to avoid typos in paths

## 📝 Additional Resources
1. [Linux Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.pdf)
2. [Bash Reference Manual](https://www.gnu.org/software/bash/manual/)
3. [Sudoers Documentation](https://www.sudo.ws/docs/)

## 📬 Contact & Contribution

Found an issue or have suggestions?
- 📧 Email: abraham.aigbokhan@outlook.com
- 📧 LinkedIn: [LinkedIn](https://www.linkedin.com/in/abraham-aigbokhan-3abb28214)
- 💻 Open an Issue or PR on [GitHub](https://github.com/Abrahamnosa23/Training/edit/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands)

## ⭐ Pro Tip: Bookmark this repo and star it for future reference!

## 🔗 View on [GitHub](https://github.com/Abrahamnosa23/Training/edit/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands)
