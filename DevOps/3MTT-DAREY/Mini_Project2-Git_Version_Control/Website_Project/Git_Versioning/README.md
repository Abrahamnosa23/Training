# Mini Project2: Git Version Control Basics  
**Implementing Git for Collaborative Development**  

## Objective  
The files in this folder demostrates how **Git** solves version control challenges by enabling safe collaboration on the same files through branching, committing, and merging.  

---

## Steps to Reproduce  

### 1. **Initialize Git Repository**  
```bash
git init
git add index.html
git commit -m "Initial commit: Homepage"
```

---

### 2. Create Feature Branches
* Aigbokhan's Branch (Navigation)
```bash
git checkout -b Aigbokhan-navigation
```
* Edit index.html
```bash
<h1>Welcome to AI Sample Company</h1>
<nav>Home | About</nav>
```
* Commit Changes
```bash
git commit -am "Added navigation menu"
```

* Abraham's Branch (Contact Info)
```bash
git checkout -b jerry-contact
```
* Edit index.html
```bash
<h1>Welcome to AI Sample Company</h1>
<p>Contact: info@aisamplecompany.com</p>
```

---

## 3. Commit Changes
```bash
git commit -am "Added contact section"
```
* Merge Changes
```bash
git checkout main
git merge Aigbokhan-navigation   # Merge Aigbokhan's changes first
git merge Abraham-contact   # Merge Abraham's changes (resolve conflicts if any)
```

### 4. View Project History
```bash
git log --graph --oneline  # Visualize branch merges
```

---

### 5. Key Features Demonstrated

| Git Feature            | Benefit                             | Example Command                          |
|------------------------|-------------------------------------|------------------------------------------|
|                                                                                                         |
| `Branching`            | Parallel work without conflicts.    | git checkout -b feature-branch           |
|                                                                                                         |
| `Commiting`            | Tracked changes with audit trail.   | git commit -m "Descriptive note"         |
|                                                                                                         |
| `Merging`              | Safe integration of changes.        | git merge feature-branch                 |
|                                                                                                         |
| `Conflict Resolution`  | Manual override when edits overlap. | Edit files marked by Git, then commit    |
|                                                                                                         |

---

### Key Takeaways

Git eliminates manual file duplication
* Single source of truth (index.html).
* No more _v1, _v2 suffixes.

Full change history:
* See who change what and when with git log.

Conflict Prevention
* Branches isolate work until ready to merge

---

### Files & Resources

Final Mergeed File
* [index.html](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project2-Git_Version_Control/Website_Project/Git_Versioning/index.html)

Screenshot of Log
* [Mini-project2 Git Log.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project2-Git_Version_Control/Website_Project/Screenshot/Mini-Project2%20Git%20Log.png)
* [Mini-Project2 Git Log_Online.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project2-Git_Version_Control/Website_Project/Screenshot/Mini-Project2%20Git%20Log_Online.png)

---

### License

This project is part of a DevOps training exercise. All rights reserved by Abraham Aigbokhan
































