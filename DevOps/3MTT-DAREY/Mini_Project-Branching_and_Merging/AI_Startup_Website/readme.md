# AI Startup Website - Collaborative Git Project

A demonstration of collaborative development using Git and GitHub, featuring complete pull request workflows, branch synchronization, and merge verification.

## Project Overview
This project demonstrates a real-world Git collaboration workflow between two developers (Tom and Jerry) with:
- Full branch creation and file modification evidence
- Documented pull request process with screenshots
- Branch synchronization procedures
- Verified merge confirmation
- Complete GitHub repository evidence

## Repository Evidence
- **GitHub Repository URL**: [https://github.com/Abrahamnosa23/AI-Startup-Website](https://github.com/Abrahamnosa23/Training/tree/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website)
- **Branches**: 
  - `main` (production)
  - `update-navigation` (merged)
  - `add-contact-info` (merged)

## Verified Workflow Documentation

### 1. Full Request Creation Process

#### Tom's Navigation Update

1. Created feature branch:
	```bash
		git checkout -b update-navigation
   	```
 ![1. Created feature tom's branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/1.%20Created%20feature%20tom's%20branch.png)

2. Modified index.html with navigation content

		<nav>Navigation Bar Content</nav>
![2. Tom adding navigation to index file.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/2.%20Tom%20adding%20navigation%20to%20index%20file.png)

3. Committed and pushed changes
	```bash
		git add index.html
		git commit -m "Add navigation bar"
		git push origin update-navigation
	```
![3. Tom Editing index file using Nano.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/3.%20Tom%20Editing%20index%20file%20using%20Nano.png)
![4. Tom Committed and pushed changes.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/4.%20Tom%20Committed%20and%20pushed%20changes.png)
![5. Switching Branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/5.%20Switching%20Branch.png)


#### Jerry's Contact Info Update

1. Synced with main branch
	```bash
		git checkout main
		git pull origin main
	```
![6. Jerry Synced with main branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/6.%20Jerry%20Synced%20with%20main%20branch.png)

2. Created features branch
	```bash
		git checkout -b add-contact-info
	```
![7. Jerry Creating contact info Branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/7.%20Jerry%20Creating%20contact%20info%20Branch.png)

3. Modified index.html with footer content
	
		<footer>Contact: info@aistartupwebsite.com</footer>
![8. Jerry adding contact info to index file.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/8.%20Jerry%20adding%20contact%20info%20to%20index%20file.png)
![9. Jerry editing index file using Nano.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/9.%20Jerry%20editing%20index%20file%20using%20Nano.png)

### 2. Branch Update & Synchronization

![10. Jerry branch update and syncing.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/10.%20Jerry%20branch%20update%20and%20syncing.png)

* Both developers ensured branch synchronization before merging
	```bash
		git fetch --all
		git rebase origin
	```
![11. Pull request.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/11.%20Pull%20request.png)
![12. Pull request.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/12.%20Pull%20request.png)
![13. Opened pull request.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/13.%20Opened%20pull%20request.png)

* Conflict resolution process documented in screenshots

![14. Conflict resolution.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/14.%20Conflict%20resolution.png)
![15. Conflict page.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/15.%20Conflict%20page.png)

![16. COnflict resolved.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/16.%20COnflict%20resolved.png)

### 3. Successful Merge Verification

![17. Code merged.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/17.%20Code%20merged.png)
![18. Merged branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/18.%20Merged%20branch.png)

* Both pull requests show completed merge status in GitHub
* Merge confirmation screenshots provided below
* Branch status
		
-----------------------------------------------------------------
-----------------------------------------------------------------
|| Branch		Purpose			Status         || 
-----------------------------------------------------------------
|| main			Production		Protected      ||
-----------------------------------------------------------------
|| update-navigation	Tom's work		Merged         ||
-----------------------------------------------------------------
|| add-contact-info	Jerry's work		Merged         ||
-----------------------------------------------------------------

## Evidence Documentation

Pull Request Creation & Merge Screenshots

1. Pull Request Creation
2. Code Review Process
3. Merge Confirmation
4. Branch Status

## Other workflow screenshot

- [1. Created feature tom's branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/1.%20Created%20feature%20tom's%20branch.png))
- [2. Tom adding navigation to index file.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/2.%20Tom%20adding%20navigation%20to%20index%20file.png)
- [3. Tom Editing index file using Nano.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/3.%20Tom%20Editing%20index%20file%20using%20Nano.png)
- [4. Tom Committed and pushed changes.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/4.%20Tom%20Committed%20and%20pushed%20changes.png)
- [5. Switching Branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/5.%20Switching%20Branch.png)
- [6. Jerry Synced with main branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/6.%20Jerry%20Synced%20with%20main%20branch.png)
- [7. Jerry Creating contact info Branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/7.%20Jerry%20Creating%20contact%20info%20Branch.png)
- [8. Jerry adding contact info to index file.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/8.%20Jerry%20adding%20contact%20info%20to%20index%20file.png)
- [9. Jerry editing index file using Nano.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/9.%20Jerry%20editing%20index%20file%20using%20Nano.png)
- [10. Jerry branch update and syncing.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/10.%20Jerry%20branch%20update%20and%20syncing.png)
- [11. Pull request.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/11.%20Pull%20request.png)
- [12. Pull request.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/12.%20Pull%20request.png)
- [13. Opened pull request.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/13.%20Opened%20pull%20request.png)
- [14. Conflict resolution.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/14.%20Conflict%20resolution.png)
- [15. Conflict page.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/15.%20Conflict%20page.png)
- [16. COnflict resolved.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/16.%20COnflict%20resolved.png)
- [17. Code merged.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/17.%20Code%20merged.png)
- [18. Merged branch.png](https://github.com/Abrahamnosa23/Training/blob/main/DevOps/3MTT-DAREY/Mini_Project-Branching_and_Merging/AI_Startup_Website/screenshot/18.%20Merged%20branch.png)

## Development Commands

	```bash
		# Compare branches
		git diff main..update-navigation

		# Check merge conflicts
		git status

		# Update local repository
		git fetch --all
		git pull origin main

		# Rebase feature branch
		git checkout feature-branch
		git rebase main
	```

## License

MIT © Abraham Aigbokhan
