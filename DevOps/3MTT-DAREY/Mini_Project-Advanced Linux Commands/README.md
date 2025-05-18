# ADVANCE LINUX COMMAND PROJECT

This project focuses on mastering Linux user and group management, file permissions, and administrative privileges.

## Project Overview

This project demonstrates comprehensive Linux system administration skills including:
- User account management
- Group permissions configuration
- File/directory permission controls
- Sudo privilege assignment


## Detailed Implementation Guide

1. User Management
- Create/modify/delete user accounts
- Set/change passwords
- Grant sudo privileges

2. Group Management
- Create/modify/delete groups
- Add/remove users from groups
- Verify group memberships

3. File Permissions
- Understand numeric/symbolic permission representations
- Modify permissions with chmod
- Change ownership with chown

4. Special Tasks
- Side Hustle Task 3 (Create 5 users in devops group)
- Directory creation with proper permissions

## Step-by-Step Implementation Guide

1. Initial Setup
```bash
# Connect to your Linux server
ssh -i "your-key.pem" username@server-ip

# Create project directory
mkdir user-management && cd user-management
```

2. User Management Tasks

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

3. Group Management Tasks

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

4. File Permission Tasks

Task 1: Create User Directories
```bash
sudo mkdir /home/mary /home/mohammed /home/ravi /home/sofia
```

Task 2: Set Permissions
```bash
# Change group ownership
sudo chown :devops /home/mary
sudo chown :devops /home/mohammed

# Set permissions (rwx for group)
sudo chmod 775 /home/mary
sudo chmod g+rwx /home/mohammed
```

Task 3: Permission Testing
```bash
# Create test file
sudo touch /home/mary/test.txt

# Set permissions (rw-rw-r--)
sudo chmod 664 /home/mary/test.txt
```

5. Side Hustle Task 3 Completion
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










































