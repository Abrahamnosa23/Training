# Linux Commands Deep Dive

This project provides a comprehensive guide to Linux file system navigation, essential commands, and system administration tasks. Learn how to safely manipulate files and directories, use powerful system commands, and understand Linux permissions.

## 📂 Project Structure
linux-command-line/
├── README.md               # This guide
├── commands-cheatsheet.md  # Quick reference for all commands
├── examples/               # Sample scripts and use cases
│   ├── file-management.sh
│   └── system-admin.sh
└── screenshots/            # Terminal outputs and examples


# 🚀 Core Commands & Concepts

## 🔍 Navigation & File System
  ```bash
      # Change directory
      cd /path/to/directory
      # List directory contents (detailed)
      ls -la
      # Show current directory path
      pwd
      # Create directory (with sudo if needed)
      mkdir new_directory
      sudo mkdir /system/directory
  ```
![1. Screenshot 2025-05-15 204032.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/1.%20Screenshot%202025-05-15%20204032.png)

![2. Screenshot 2025-05-15 204141.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/2.%20Screenshot%202025-05-15%20204141.png)

![3. Screenshot 2025-05-15 204336.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/3.%20Screenshot%202025-05-15%20204336.png)

![4. Screenshot 2025-05-15 204513.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/4.%20Screenshot%202025-05-15%20204513.png)

![5. Screenshot 2025-05-15 204740.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/5.%20Screenshot%202025-05-15%20204740.png)

![6. Screenshot 2025-05-15 204752.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/6.%20Screenshot%202025-05-15%20204752.png)

![7. Screenshot 2025-05-15 204846.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/7.%20Screenshot%202025-05-15%20204846.png)

![8. Screenshot 2025-05-15 205129.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/8.%20Screenshot%202025-05-15%20205129.png)


## 📁 File Operations
 ```bash
      # Create empty file
      touch filename.txt
      
      # View file contents
      cat filename.txt
      
      # Copy files
      cp source.txt destination/
      
      # Move/rename files
      mv oldname.txt newname.txt
      
      # Delete files (CAUTION)
      rm filename.txt
```

![9. Screenshot 2025-05-15 205213.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/9.%20Screenshot%202025-05-15%20205213.png)

![10. Screenshot 2025-05-15 210443.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/10.%20Screenshot%202025-05-15%20210443.png)

![11. Screenshot 2025-05-15 210511.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/11.%20Screenshot%202025-05-15%20210511.png)

![12. Screenshot 2025-05-15 210659.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/12.%20Screenshot%202025-05-15%20210659.png)

![13. Screenshot 2025-05-15 210852.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/13.%20Screenshot%202025-05-15%20210852.png)

![14. Screenshot 2025-05-15 211022.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/14.%20Screenshot%202025-05-15%20211022.png)

## ⚠️ Dangerous Commands (Use with Care)
  ```bash
      # Recursive delete (EXTREME CAUTION)
      rm -rf directory/
      
      # Sudo operations (verify before running)
      sudo rm important_file
  ```
![15. Screenshot 2025-05-15 211139.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/15.%20Screenshot%202025-05-15%20211139.png)

![16. Screenshot 2025-05-15 211211.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Basic-Linux-Commands/Screenshots/16.%20Screenshot%202025-05-15%20211211.png)

## 🛠️ Step-by-Step Tutorials

### 1. Creating and Managing Directories
  ```bash
      # Create nested directory structure
      mkdir -p ~/projects/linux/new_project
      
      # Verify creation
      ls -R ~/projects
      
      # Remove empty directory
      rmdir ~/projects/linux/new_project
  ```
### 2. File Manipulation Workflow
  ```bash
      # Create test files
      touch file{1..3}.txt
      
      # Copy with confirmation
      cp -i file1.txt backup/
      
      # Bulk rename/move
      mv *.txt text_files/
  ```
### 3. Using Sudo Safely
  ```bash
      # Create system directory (requires sudo)
      sudo mkdir /opt/myapp
      
      # Change ownership
      sudo chown $USER:$USER /opt/myapp
      
      # Verify permissions
      ls -ld /opt/myapp
  ```

## 📊 Command Reference Table

  | Command	        | Description	                |Safety Level      |
  |-----------------|-----------------------------|------------------|
  | ls	            | List directory contents	    | Safe             |
  | cp	            | Copy files/directories      | Safe             |
  | mv	            | Move/rename files	          | Caution          |
  | rm              | Delete files                |	Dangerous        |              
  | sudo	          | Execute as superuser	      | Extreme Caution  |
  | chmod	          | Change permissions	        | Caution          ||


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
