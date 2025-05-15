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

     ![1. Screenshot 2025-05-14 225357.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/1.%20Screenshot%202025-05-14%20225357.png)
     ![2. Screenshot 2025-05-14 225503.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/2.%20Screenshot%202025-05-14%20225503.png)
     ![3. Screenshot 2025-05-14 225523.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/3.%20Screenshot%202025-05-14%20225523.png)

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
![4. Screenshot 2025-05-14 204144.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/4.%20Screenshot%202025-05-14%20204144.png)
![5. Screenshot 2025-05-14 221518.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/5.%20Screenshot%202025-05-14%20221518.png)
![6. Screenshot 2025-05-14 225732.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/6.%20Screenshot%202025-05-14%20225732.png)
![7. Screenshot 2025-05-14 225847.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/7.%20Screenshot%202025-05-14%20225847.png)

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

|Task	              |  Command                    |
|---------------------|-----------------------------|
|                     |                             |
|Connect to EC2	      |  ssh -i "key.pem" user@ip   |
|                     |                             |
|Update Packages	  |  sudo apt update            |
|                     |                             |
|Install Software     |  sudo apt install <package> |
|                     |                             |
|Check Version        |  <package> --version        |
|                     |                             |
|Uninstall	          |  sudo apt remove <package>  |

   ![8. Screenshot 2025-05-14 225917.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/8.%20Screenshot%202025-05-14%20225917.png)
   ![9. Screenshot 2025-05-14 231229.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/9.%20Screenshot%202025-05-14%20231229.png)
   ![10. Screenshot 2025-05-14 231732.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/10.%20Screenshot%202025-05-14%20231732.png)
   ![11. Screenshot 2025-05-14 231801.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/11.%20Screenshot%202025-05-14%20231801.png)
   ![12. Screenshot 2025-05-14 231835.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/12.%20Screenshot%202025-05-14%20231835.png)
   ![13. Screenshot 2025-05-14 231847.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/13.%20Screenshot%202025-05-14%20231847.png)
   
## 📸 Screenshots
- SSH Connection: SSH Success
- Tree Command Output: Tree Output

     ![1. Screenshot 2025-05-14 225357.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/1.%20Screenshot%202025-05-14%20225357.png)
     ![2. Screenshot 2025-05-14 225503.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/2.%20Screenshot%202025-05-14%20225503.png)
     ![3. Screenshot 2025-05-14 225523.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/3.%20Screenshot%202025-05-14%20225523.png)
     ![4. Screenshot 2025-05-14 204144.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/4.%20Screenshot%202025-05-14%20204144.png)
     ![5. Screenshot 2025-05-14 221518.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/5.%20Screenshot%202025-05-14%20221518.png)
     ![6. Screenshot 2025-05-14 225732.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/6.%20Screenshot%202025-05-14%20225732.png)
     ![7. Screenshot 2025-05-14 225847.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/7.%20Screenshot%202025-05-14%20225847.png)
     ![8. Screenshot 2025-05-14 225917.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/8.%20Screenshot%202025-05-14%20225917.png)
     ![9. Screenshot 2025-05-14 231229.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/9.%20Screenshot%202025-05-14%20231229.png)
    ![10. Screenshot 2025-05-14 231732.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/10.%20Screenshot%202025-05-14%20231732.png)
    ![11. Screenshot 2025-05-14 231801.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/11.%20Screenshot%202025-05-14%20231801.png)
    ![12. Screenshot 2025-05-14 231835.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/12.%20Screenshot%202025-05-14%20231835.png)
    ![13. Screenshot 2025-05-14 231847.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals/screenshots/13.%20Screenshot%202025-05-14%20231847.png)

## 💡 Best Practices

### 🔐 Security:
   * Always restrict SSH access to your IP.
   * Use chmod 400 for .pem files.
### 🔄 Maintenance:
   * Run sudo apt update && sudo apt upgrade weekly.
### 🗑️ Cleanup:
   * Remove unused packages with sudo apt autoremove.

## 📜 License
- MIT License. See LICENSE.

## 📬 Contact
- Questions? Open an Issue or reach out:
    * Email: abraham.aigbokhan@outlook.com
    * LinkedIn: [Linkedin](https://www.linkedin.com/in/abraham-aigbokhan-3abb28214)

## ⭐ Star this repo if you found it helpful

## 🎯 Next Steps
  * Automate deployments with Terraform/Ansible.
  * Set up Nginx/Apache for web hosting.
  * Explore AWS S3/CloudFront for static sites.

## 🔗 [View on GitHub](https://github.com/Abrahamnosa23/Training/tree/main/DevOps/3MTT-DAREY/Mini-Project_Lunux-Fundamentals)
