# Interactive Web Story – Git Capstone Project

This is the final capstone project for the Git module. It demonstrates my understanding of Git version control, collaboration workflows, and basic web development using HTML and CSS.

---

## Objective

To collaboratively build an interactive and engaging web story using Git for version control. This project includes:

- Setting up a Git-tracked project
- Creating and switching between branches
- Merging code and resolving conflicts
- Developing a basic HTML/CSS website
- Documenting the process with screenshots

---

## Project Structure
interactive-web-story/
│
├── index.html
├── style.css
└── readme.md


---

## Step-by-Step Implementation

### 1. Initialize Git Repository

**Action Taken:**
- Created project folder
- Initialized Git

```bash
mkdir interactive-web-story
cd interactive-web-story
git init
```

![1. Screenshot 2025-05-05 195934.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/1.%20Screenshot%202025-05-05%20195934.png)

### 2. Create HTML and CSS Files

```bash
touch index.html style.css
```

![2. Screenshot 2025-05-05 204746.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/2.%20Screenshot%202025-05-05%20204746.png)

### 3. Add Initial HTML and CSS Content

Files Updated:

  * index.html with page structure and placeholder text
  * style.css for basic styling

![3. Screenshot 2025-05-05 204941.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/3.%20Screenshot%202025-05-05%20204941.png)

### 4. Commit Initial Files
```bash
git add .
git commit -m "Initial commit: project setup with HTML and CSS"
```

![4. Screenshot 2025-05-05 205909.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/4.%20Screenshot%202025-05-05%20205909.png)

### 5. Create Branch: add-intro-section
```bash
git checkout -b add-intro-section
```
  * Added a new <section> for Introduction.

![5. Screenshot 2025-05-05 210130.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/5.%20Screenshot%202025-05-05%20210130.png)

### 6. Commit and Merge add-intro-section
```bash
git add index.html
git commit -m "Add intro section"
git checkout main
git merge add-intro-section
```

![6. Screenshot 2025-05-05 233605.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/6.%20Screenshot%202025-05-05%20233605.png)

### 7. Create Branch: add-character-section
```bash
git checkout -b add-character-section
```
  * Added a character description section.

![7. Screenshot 2025-05-05 234210.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/7.%20Screenshot%202025-05-05%20234210.png)

### 8. Merge Character Branch
```bash
git add index.html
git commit -m "Add character section"
git checkout main
git merge add-character-section
```

![8. Screenshot 2025-05-05 234846.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/8.%20Screenshot%202025-05-05%20234846.png)

### 9. Simulate and Resolve Merge Conflict
  * Created two branches editing same line in index.html.
  * Merged and resolved conflict manually.

![9. Screenshot 2025-05-05 235220.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/9.%20Screenshot%202025-05-05%20235220.png)

---

## Project Outcome
  * Demonstrated Git workflows (branching, merging, resolving conflicts)
  * Built a creative and interactive web story
  * Practiced real-world collaboration structure
  * Strengthened storytelling through code

---

## To Run the Project
  Open index.html in any web browser

---

## Contributors
  Abraham Aigbokhan - Corporate Student, Darey.io

---

## Screenshots
 - All screenshot files can be found in the /Screenshot directory.

![10. Screenshot 2025-05-05 235231.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/10.%20Screenshot%202025-05-05%20235231.png)

![11. Screenshot 2025-05-05 235449.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/11.%20Screenshot%202025-05-05%20235449.png)

![12. Screenshot 2025-05-06 203835.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/12.%20Screenshot%202025-05-06%20203835.png)

![13. Screenshot 2025-05-06 204105.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/13.%20Screenshot%202025-05-06%20204105.png)

![14. Screenshot 2025-05-06 204128.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/14.%20Screenshot%202025-05-06%20204128.png)

![15. Screenshot 2025-05-06 204140.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/15.%20Screenshot%202025-05-06%20204140.png)

![16. Screenshot 2025-05-06 204210.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/16.%20Screenshot%202025-05-06%20204210.png)

![17. Screenshot 2025-05-06 204227.png](https://github.com/Abrahamnosa23/Training/blob/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot/17.%20Screenshot%202025-05-06%20204227.png)

---


## License
  MIT






































