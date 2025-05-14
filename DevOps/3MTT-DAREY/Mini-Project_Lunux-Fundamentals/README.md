# Linux Server Management: AWS EC2 Setup, SSH & Package Installation

## This project demonstrates how to:
- ✅ Set up an AWS EC2 Linux server
- ✅ Connect via SSH using a .pem key
- ✅ Manage packages using apt (Ubuntu/Debian)
- ✅ Install, verify, update, and remove software (e.g., tree)

## 📂 Project Structure
```bash
    linux-server-management/  
    ├── README.md          # This guide  
    ├── screenshots/       # Example terminal outputs  
    └── commands.md        # Key Linux commands used  
```
## 🚀 Step-by-Step Guide

### 1. Set Up an AWS EC2 Instance
  1. Sign in to AWS Console → Navigate to EC2.
  2. Launch Instance:
     * OS: Ubuntu 22.04 LTS (free tier eligible).
     * Key Pair: Create/download a .pem file (e.g., ubuntu.pem).
     * Security Group: Allow SSH (port 22) from your IP.
  3. Note the Public IPv4/IPv6 Address.

### 2. Connect to the Server via SSH

#### On Linux/macOS:
  ```bash
    chmod 400 ~/Downloads/ubuntu.pem          # Set key permissions
    ssh -i "~/Downloads/ubuntu.pem" ubuntu@<PUBLIC_IP>
  ```
#### On Windows (Using Git Bash/PuTTY):
  ```bash
ssh -i "C:\path\to\ubuntu.pem" ubuntu@<PUBLIC_IP>
  ```

### 3. Install & Manage Packages

#### Update Package Lists
  ```bash
    sudo apt update
  ```
#### Install a Package (e.g., tree)
  ```bash
    sudo apt install tree
  ```
#### Verify Installation
  ```bash
    tree ~/Downloads      # Display directory structure
  ```
#### Update Installed Packages
  ```bash
    sudo apt upgrade
  ```
#### Remove a Package
  ```bash
    sudo apt remove tree
  ```

## 🔧 Key Commands Cheatsheet

Task	              |  Command

Connect to EC2	    |  ssh -i "key.pem" user@ip

Update Packages	    |  sudo apt update

Install Software	   sudo apt install <package>

Check Version	       <package> --version

Uninstall	           sudo apt remove <package>
