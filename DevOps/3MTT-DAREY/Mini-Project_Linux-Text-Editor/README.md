# Linux Text Editors Mastery Project

## Project Overview
This project demonstrates proficiency in using Vim and Nano text editors in Linux environment. It covers:
- Basic file operations
- Text manipulation
- Saving and exiting
- Key differences between editors

## Project Requirements Analysis

Master Vim Editor
- Create/edit files
- Navigate in command/insert modes
- Save changes and exit
- Perform text manipulations (deletions, undos)

Master Nano Editor
- Create/edit files
- Basic text editing
- Save changes and exit
- Compare with Vim

## Vim Editor Guide

### Basic Commands
| Command | Action |
|---------|--------|
| `vim file.txt` | Open/create file |
| `i` | Enter Insert mode |
| `ESC` | Exit Insert mode |
| `:w` | Save file |
| `:q` | Quit |
| `:wq` | Save and quit |

### Step-by-Step Project Completion Guide

#### Vim Editor Tasks

Task 1: Basic File Operations
```bash
# Create and open a new file
vim exercise.txt
```
![1. Screenshot 2025-05-16 214637.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/1.%20Screenshot%202025-05-16%20214637.png)
![2. Screenshot 2025-05-16 214651.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/2.%20Screenshot%202025-05-16%20214651.png)

1. Press i to enter Insert mode

![3. Screenshot 2025-05-16 214802.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/3.%20Screenshot%202025-05-16%20214802.png)

2. Type:

```bash
Hello, this is a Vim hands-on project.
Welcome to darcy.io.
```
![3. Screenshot 2025-05-16 214802.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/3.%20Screenshot%202025-05-16%20214802.png)


3. Save and exit:
- Press ESC to exit Insert mode
- Type :wq and press Enter

![4. Screenshot 2025-05-16 214906.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/4.%20Screenshot%202025-05-16%20214906.png)

Task 2: Advanced Editing
```bash
vim exercise.txt
```
1. Enter multiple lines of text
2. Practice:
- Delete characters with x

![5. Screenshot 2025-05-16 214957.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/5.%20Screenshot%202025-05-16%20214957.png)

- Delete lines with dd

![6. Screenshot 2025-05-16 215029.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/6.%20Screenshot%202025-05-16%20215029.png)

- Undo with u

![7. Screenshot 2025-05-16 215130.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/7.%20Screenshot%202025-05-16%20215130.png)

- Save without exiting (:w)

![8. Screenshot 2025-05-16 215257.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/8.%20Screenshot%202025-05-16%20215257.png)

- Exit without saving (:q!)

![9. Screenshot 2025-05-16 215321.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Vim%20Exercise/9.%20Screenshot%202025-05-16%20215321.png)

## Nano Editor Guide

### Basic Commands
| Command | Action |
|---------|--------|
| `nano file.txt` | Open/create file |
| `Ctrl+O` | Save file |
| `Ctrl+X` | Exit |
| `Ctrl+K` | Cut line |
| `Ctrl+U` | Paste |

#### Nano Editor Tasks

Task 1: Basic File Operations
```bash
nano nano_file.txt
```

![1. Screenshot 2025-05-16 215801.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Nano%20Exercise/1.%20Screenshot%202025-05-16%20215801.png)

1. Type some text

![2. Screenshot 2025-05-16 215916.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Nano%20Exercise/2.%20Screenshot%202025-05-16%20215916.png)

2. Save: Ctrl+O, then Enter

![3. Screenshot 2025-05-16 215935.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Nano%20Exercise/3.%20Screenshot%202025-05-16%20215935.png)

3. Exit: Ctrl+X

![4. Screenshot 2025-05-16 220009.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Nano%20Exercise/4.%20Screenshot%202025-05-16%20220009.png)


Task 2: Editing Practice
```bash
nano existing_file.txt
```

![5. Screenshot 2025-05-16 220053.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Nano%20Exercise/5.%20Screenshot%202025-05-16%20220053.png)

1. Navigate with arrow keys
2. Practice:
- Text insertion/deletion

![6. Screenshot 2025-05-16 220104.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini-Project_Linux-Text-Editor/Screenshots/Nano%20Exercise/6.%20Screenshot%202025-05-16%20220104.png)

- Line operations
- Save changes

## Key Differences
| Feature | Vim | Nano |
|---------|-----|------|
| Learning Curve | Steep | Easy |
| Modes | Multiple modes | Single mode |
| Customization | Extensive | Limited |
| Pre-installed | Usually yes | Sometimes |

## Project Structure
Mini-Project_Linux-Text-Editors/
├── Screenshots # Contain screenshots
    ├── Vim Exercise # Contain screenshots for the vim exercise
    ├── Nano Exercise # Contain screenshots for the nano exercise
└── README.md # COntain the readme for the project


## How to Reproduce
1. SSH into Linux server
2. Clone this repo
3. Follow the commands in each section

## Author
Name: Abraham Aigbokhan  
Email: abraham.aigbokhan@outlook.com
