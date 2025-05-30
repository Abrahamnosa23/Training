# ADVANCE LINUX COMMAND PROJECT

This project focuses on mastering Linux user and group management, file permissions, and administrative privileges.

## Project Overview

This project demonstrates comprehensive Linux system administration skills including:
- File/directory permission controls
- User account management
- Group permissions configuration
- Sudo privilege assignment


## Detailed Implementation Guide

1. File Permissions
- Understand numeric/symbolic permission representations
- Modify permissions with chmod
- Change ownership with chown

2. User Management
- Create/modify/delete user accounts
- Set/change passwords
- Grant sudo privileges

3. Group Management
- Create/modify/delete groups
- Add/remove users from groups
- Verify group memberships

4. Special Tasks
- Side Hustle Task 3 (Create 5 users in devops group)
- Directory creation with proper permissions

## Step-by-Step Implementation Guide

### 1. File Permission Tasks

Task 1: Create User Directories
```bash
sudo mkdir /c/abrahamnosa23/Training/DevOps/3MTT-DAREY/Mini_Project-Advanced Linux Commands
```
```bash
touch script.sh
```
![1. Screenshot 2025-05-29 233315.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/1.%20Screenshot%202025-05-29%20233315.png)
```bash
ls -latr script.sh
```
![2. Screenshot 2025-05-29 233425.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/2.%20Screenshot%202025-05-29%20233425.png)
Task 2: Set Permissions
```bash
 chmod +x script.sh
```
![3. Screenshot 2025-05-29 233549.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/3.%20Screenshot%202025-05-29%20233549.png)
```bash
ls -latr script.sh
```
![4. Screenshot 2025-05-29 233659.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/4.%20Screenshot%202025-05-29%20233659.png)
```bash
chmod 755 script.sh
```
![4. Screenshot 2025-05-29 233659.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/4.%20Screenshot%202025-05-29%20233659.png)
```bash
ls -latr note.txt
```
![5. Screenshot 2025-05-29 234357.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/5.%20Screenshot%202025-05-29%20234357.png)
![6. Screenshot 2025-05-29 234618.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/6.%20Screenshot%202025-05-29%20234618.png)

### 2. User Management Tasks

Task 1: Create Users

![7. Screenshot 2025-05-30 181128.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/7.%20Screenshot%202025-05-30%20181128.png)

![8. Screenshot 2025-05-30 181309.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/8.%20Screenshot%202025-05-30%20181309.png)

```bash
sudo adduser mary
sudo adduser mohammed
sudo adduser ravi
sudo adduser tunji
sudo adduser sofia
```
![22. Screenshot 2025-05-30 184844.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/22.%20Screenshot%202025-05-30%20184844.png)

![10. Screenshot 2025-05-30 181604.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/10.%20Screenshot%202025-05-30%20181604.png)

Follow prompts to set passwords and user info

![8. Screenshot 2025-05-30 181309.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/8.%20Screenshot%202025-05-30%20181309.png)

Task 2: Modify Users
```bash
# Change password
sudo passwd Johndoe

# Grant sudo privileges
sudo usermod -aG sudo Johndoe
```
![12. Screenshot 2025-05-30 181816.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/12.%20Screenshot%202025-05-30%20181816.png)

![13. Screenshot 2025-05-30 183231.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/13.%20Screenshot%202025-05-30%20183231.png)



![9. Screenshot 2025-05-30 181342.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/9.%20Screenshot%202025-05-30%20181342.png)

![11. Screenshot 2025-05-30 181616.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/11.%20Screenshot%202025-05-30%20181616.png)

![14. Screenshot 2025-05-30 183415.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/14.%20Screenshot%202025-05-30%20183415.png)

![15. Screenshot 2025-05-30 183518.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/15.%20Screenshot%202025-05-30%20183518.png)



Task 3: Delete Users
```bash
sudo userdel -r tunji  # -r removes home directory
```

### 3. Group Management Tasks

Task 1: Create Groups
```bash
sudo groupadd devops
sudo groupadd developers
```
![21. Screenshot 2025-05-30 184700.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/21.%20Screenshot%202025-05-30%20184700.png)

![16. Screenshot 2025-05-30 183524.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/16.%20Screenshot%202025-05-30%20183524.png)

![17. Screenshot 2025-05-30 183855.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/17.%20Screenshot%202025-05-30%20183855.png)

![19. Screenshot 2025-05-30 184331.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/19.%20Screenshot%202025-05-30%20184331.png)

![20. Screenshot 2025-05-30 184612.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/20.%20Screenshot%202025-05-30%20184612.png)

Task 2: Add Users to Groups
```bash
sudo usermod -aG devops mary
sudo usermod -aG devops mohammed
sudo usermod -aG devops ravi
sudo usermod -aG devops sofia
```
![22. Screenshot 2025-05-30 184844.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/22.%20Screenshot%202025-05-30%20184844.png)

![23. Screenshot 2025-05-30 185121.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/23.%20Screenshot%202025-05-30%20185121.png)

![24. Screenshot 2025-05-30 185305.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/24.%20Screenshot%202025-05-30%20185305.png)

Task 3: Verify Memberships
```bash
id mary  # Check groups for mary
groups ravi  # Alternative check
```
![25. Screenshot 2025-05-30 185807.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/25.%20Screenshot%202025-05-30%20185807.png)

### 4. Side Hustle Task 3 Completion
```bash
# Create devops group and users
sudo groupadd devops
for user in mary mohammed ravi tunji sofia; do
  sudo adduser $user
  sudo usermod -aG devops $user
  sudo mkdir /home/$user
  sudo chown $user:devops /home/$user
  sudo chmod 770 /home/$user
done
```
![20. Screenshot 2025-05-30 184612.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/20.%20Screenshot%202025-05-30%20184612.png)

![21. Screenshot 2025-05-30 184700.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/21.%20Screenshot%202025-05-30%20184700.png)

![22. Screenshot 2025-05-30 184844.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/22.%20Screenshot%202025-05-30%20184844.png)

![23. Screenshot 2025-05-30 185121.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/23.%20Screenshot%202025-05-30%20185121.png)

![24. Screenshot 2025-05-30 185305.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/24.%20Screenshot%202025-05-30%20185305.png)

![25. Screenshot 2025-05-30 185807.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Advanced%20Linux%20Commands/Screenshots/25.%20Screenshot%202025-05-30%20185807.png)

## Screenshots
- User Creation
- Group Verification
- Permission Changes

## Key Learnings
1. Always use sudo for system changes
2. The -aG flag preserves existing group memberships
3. Permission values are additive (7 = 4+2+1)
4. Home directories should have 700 or 750 permissions

## How to Reproduce
1. SSH into Linux server
2. Clone this repository
3. Run scripts in order:
```bash
./scripts/create-users.sh
./scripts/set-permissions.sh
```

## Author
- Name: Abraham Aigbokhan
- Email: abraham.aigbokhan@outlook.com
- Linkedin: [LinkedIn](https://www.linkedin.com/in/abraham-aigbokhan-3abb28214)










































