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

## ⚠️ Dangerous Commands (Use with Care)
  ```bash
      # Recursive delete (EXTREME CAUTION)
      rm -rf directory/
      
      # Sudo operations (verify before running)
      sudo rm important_file
  ```

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
