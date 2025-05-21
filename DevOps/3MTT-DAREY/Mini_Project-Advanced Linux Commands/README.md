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
```bash
ls -latr script.sh
```

Task 2: Set Permissions
```bash
 chmod +x script.sh
```
```bash
ls -latr script.sh
```
```bash
chmod 755 script.sh
```
```bash
ls -latr note.txt
```

Task 3: Permission Testing
```bash
# Create test file
sudo touch /home/mary/test.txt

# Set permissions (rw-rw-r--)
sudo chmod 664 /home/mary/test.txt
```
### 2. User Management Tasks

Task 1: Create Users
```bash
sudo adduser mary
sudo adduser mohammed
sudo adduser ravi
sudo adduser tunji
sudo adduser sofia
```
Follow prompts to set passwords and user info

Task 2: Modify Users
```bash
# Change password
sudo passwd mary

# Grant sudo privileges
sudo usermod -aG sudo mary
```

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

Task 2: Add Users to Groups
```bash
sudo usermod -aG devops mary
sudo usermod -aG devops mohammed
sudo usermod -aG devops ravi
sudo usermod -aG devops sofia
```

Task 3: Verify Memberships
```bash
id mary  # Check groups for mary
groups ravi  # Alternative check
```

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










































