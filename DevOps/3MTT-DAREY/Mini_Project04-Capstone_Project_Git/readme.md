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

Screenshot

### 3. Add Initial HTML and CSS Content

Files Updated:

  * index.html with page structure and placeholder text
  * style.css for basic styling

Screenshot:

### 4. Commit Initial Files
```bash
git add .
git commit -m "Initial commit: project setup with HTML and CSS"
```

Screenshot

### 5. Create Branch: add-intro-section
```bash
git checkout -b add-intro-section
```
  * Added a new <section> for Introduction.

Screenshot

### 6. Commit and Merge add-intro-section
```bash
git add index.html
git commit -m "Add intro section"
git checkout main
git merge add-intro-section
```

Screenshot

### 7. Create Branch: add-character-section
```bash
git checkout -b add-character-section
```
  * Added a character description section.

Screenshot

### 8. Merge Character Branch
```bash
git add index.html
git commit -m "Add character section"
git checkout main
git merge add-character-section
```

Screenshot

### 9. Simulate and Resolve Merge Conflict
  * Created two branches editing same line in index.html.
  * Merged and resolved conflict manually.

Screenshot

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
 - All screenshot can be found in the /screenshots directory.
 - [Screenshot](https://github.com/Abrahamnosa23/Training/tree/add-character-section/DevOps/3MTT-DAREY/Mini_Project04-Capstone_Project_Git/Screenshot)
  
---

## License
  MIT






































