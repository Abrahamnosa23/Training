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

### 5. Key Features Demonstrated









































