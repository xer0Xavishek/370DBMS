# Collaboration Guide for 370DBMS Project

This guide provides step-by-step instructions for working on this repository with friends or team members. Whether you're working together for the first time or are experienced collaborators, this guide will help you work efficiently and avoid common pitfalls.

## 🎯 Quick Start for Collaborators

### First Time Setup

1. **Get Access to the Repository**
   - Ask the repository owner (Avishek Biswas or Sreema Roy) to add you as a collaborator
   - Go to: `https://github.com/xer0Xavishek/370DBMS/settings/access`
   - Once added, you'll receive an invitation email

2. **Clone the Repository**
   ```bash
   git clone https://github.com/xer0Xavishek/370DBMS.git
   cd 370DBMS
   ```

3. **Set Up Your Development Environment**
   - Install a database management system (MySQL, PostgreSQL, etc.)
   - Install a SQL client (MySQL Workbench, pgAdmin, DBeaver, etc.)
   - Install Git on your system
   - Configure your Git identity:
     ```bash
     git config --global user.name "Your Name"
     git config --global user.email "your.email@example.com"
     ```

4. **Explore the Repository Structure**
   - Read `README.md` for project overview
   - Review `CONTRIBUTING.md` for coding standards
   - Check `PROJECT_STRUCTURE.md` to understand file organization

## 🔄 Daily Workflow

### Before Starting Work

1. **Always Start with Latest Changes**
   ```bash
   # Switch to main branch
   git checkout main
   
   # Pull latest changes
   git pull origin main
   ```

2. **Create a Feature Branch**
   ```bash
   # Create and switch to a new branch
   git checkout -b feature/your-feature-name
   
   # Example names:
   # git checkout -b feature/add-customer-queries
   # git checkout -b fix/order-procedure-bug
   # git checkout -b docs/update-er-diagram
   ```

### While Working

1. **Make Changes**
   - Work on your assigned task
   - Follow the coding standards in `CONTRIBUTING.md`
   - Test your changes thoroughly

2. **Commit Regularly**
   ```bash
   # Check what files you've changed
   git status
   
   # Add files to staging
   git add path/to/file.sql
   # Or add all changes:
   git add .
   
   # Commit with a descriptive message
   git commit -m "feat(queries): add customer order history query"
   ```

3. **Keep Your Branch Updated**
   ```bash
   # Fetch latest changes from main
   git fetch origin main
   
   # Merge main into your branch
   git merge origin/main
   
   # Resolve any conflicts if they occur
   ```

### After Completing Work

1. **Push Your Branch**
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create a Pull Request**
   - Go to: `https://github.com/xer0Xavishek/370DBMS/pulls`
   - Click "New Pull Request"
   - Select your branch
   - Fill in the PR template with:
     - Clear description of changes
     - Why the changes were made
     - How to test the changes
   - Request review from your collaborator

3. **Address Review Comments**
   - Read all review comments carefully
   - Make requested changes
   - Push updates to the same branch:
     ```bash
     git add .
     git commit -m "fix: address review comments"
     git push origin feature/your-feature-name
     ```

4. **Merge After Approval**
   - Once approved, merge the pull request
   - Delete the feature branch (optional but recommended)

## 👥 Collaboration Best Practices

### Communication

1. **Use GitHub Issues**
   - Create issues for bugs, features, or questions
   - Assign issues to team members
   - Use labels: `bug`, `enhancement`, `documentation`, `question`
   - Reference issues in commits: `fixes #123` or `closes #456`

2. **Use Pull Request Discussions**
   - Ask questions in PR comments
   - Provide constructive feedback
   - Use GitHub's suggestion feature for code changes

3. **Regular Sync-ups**
   - Discuss progress regularly (daily or weekly)
   - Share what you're working on
   - Identify blockers early
   - Coordinate on overlapping work

### Division of Work

1. **Assign Clear Responsibilities**
   ```
   Example division:
   - Person A: Database schema design and creation scripts
   - Person B: Queries and stored procedures
   - Person A: ER diagrams and documentation
   - Person B: Testing and sample data
   ```

2. **Use GitHub Projects** (Optional)
   - Create a project board
   - Add cards for tasks
   - Move cards through: To Do → In Progress → Review → Done

3. **Avoid Working on Same Files**
   - Coordinate to minimize merge conflicts
   - If you must edit the same file:
     - Work on different sections
     - Communicate frequently
     - Pull and merge often

### Code Quality

1. **Review Each Other's Code**
   - Review all pull requests before merging
   - Check for:
     - Code quality and style
     - Proper comments
     - No sensitive data
     - Tests included

2. **Test Before Committing**
   - Run all SQL scripts to ensure no syntax errors
   - Test queries with sample data
   - Verify stored procedures work correctly
   - Check that nothing breaks existing functionality

3. **Document Your Work**
   - Add comments to complex SQL
   - Update README files when adding features
   - Keep diagrams synchronized with code
   - Document assumptions and decisions

## 🚨 Handling Common Scenarios

### Merge Conflicts

When Git can't automatically merge changes:

1. **Don't Panic**
   - Conflicts are normal in collaboration

2. **Resolve Conflicts**
   ```bash
   # Git will mark conflicts in files like this:
   <<<<<<< HEAD
   Your changes
   =======
   Their changes
   >>>>>>> branch-name
   
   # Edit the file to keep the correct version
   # Remove the conflict markers
   ```

3. **Complete the Merge**
   ```bash
   git add resolved-file.sql
   git commit -m "merge: resolve conflicts in resolved-file.sql"
   git push origin your-branch-name
   ```

4. **Ask for Help**
   - If unsure, ask your collaborator
   - Better to discuss than make wrong choice

### Accidentally Committing Wrong Files

1. **Before Pushing**
   ```bash
   # Undo last commit but keep changes
   git reset --soft HEAD~1
   
   # Or undo last commit and discard changes
   git reset --hard HEAD~1
   ```

2. **After Pushing**
   ```bash
   # Revert the commit (creates new commit)
   git revert HEAD
   git push origin your-branch-name
   ```

### Working on Same File Simultaneously

1. **Prevention (Best)**
   - Communicate before starting work
   - Divide the file into sections
   - Work on different branches

2. **If It Happens**
   - Pull and merge frequently (every few hours)
   - Keep changes small and focused
   - Merge one person's work first, then the other

### Lost or Confused About Changes

1. **View History**
   ```bash
   # See commit history
   git log --oneline
   
   # See what changed in a commit
   git show commit-hash
   
   # See changes in a file
   git log -p path/to/file.sql
   ```

2. **Compare Branches**
   ```bash
   # See differences between branches
   git diff main..your-branch-name
   ```

3. **Restore a File**
   ```bash
   # Restore file from main branch
   git checkout main -- path/to/file.sql
   ```

## 📋 Collaborative Checklist

### Before Starting a Task
- [ ] Pull latest changes from main
- [ ] Create a new feature branch
- [ ] Understand the task requirements
- [ ] Check if anyone else is working on related files
- [ ] Review relevant documentation

### While Working
- [ ] Follow coding standards
- [ ] Write clear comments
- [ ] Test your changes
- [ ] Commit regularly with good messages
- [ ] Pull and merge main branch periodically

### Before Creating a Pull Request
- [ ] Run all SQL scripts to check for errors
- [ ] Test queries with sample data
- [ ] Update documentation if needed
- [ ] Review your own changes
- [ ] Write a clear PR description

### After Creating a Pull Request
- [ ] Respond to review comments promptly
- [ ] Make requested changes
- [ ] Thank reviewers for their feedback
- [ ] Merge only after approval
- [ ] Delete feature branch after merge

## 🛠️ Useful Git Commands

### Basic Commands
```bash
# Check status of your files
git status

# See what you've changed
git diff

# See commit history
git log --oneline --graph

# Switch branches
git checkout branch-name

# Create and switch to new branch
git checkout -b new-branch-name
```

### Intermediate Commands
```bash
# Stash changes temporarily
git stash
git stash pop

# Cherry-pick a commit from another branch
git cherry-pick commit-hash

# Undo changes to a file
git checkout -- path/to/file.sql

# See who changed each line of a file
git blame path/to/file.sql
```

### Branch Management
```bash
# List all branches
git branch -a

# Delete local branch
git branch -d branch-name

# Delete remote branch
git push origin --delete branch-name

# Rename current branch
git branch -m new-name
```

## 🎓 Learning Resources

### Git and GitHub
- [GitHub Guides](https://guides.github.com/)
- [Git Handbook](https://guides.github.com/introduction/git-handbook/)
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials)
- [Oh Shit, Git!?!](https://ohshitgit.com/) - Fixing common mistakes

### SQL and Databases
- [SQL Style Guide](https://www.sqlstyle.guide/)
- [Database Design Best Practices](https://www.vertabelo.com/blog/database-design-best-practices/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

### Collaboration
- [How to Write a Good Pull Request](https://github.blog/2015-01-21-how-to-write-the-perfect-pull-request/)
- [Code Review Best Practices](https://google.github.io/eng-practices/review/)

## 📞 Getting Help

### Within the Team
1. **Ask Questions Early** - Don't wait until you're stuck
2. **Use GitHub Issues** - Create issues for questions
3. **Schedule Meetings** - When async communication isn't enough
4. **Share Screen** - For complex problems

### External Resources
1. **Stack Overflow** - For technical questions
2. **GitHub Community** - For GitHub-specific help
3. **Database Forums** - For database-specific questions
4. **Course Instructor/TAs** - For project guidance

## ✅ Success Metrics

You're collaborating well when:

- ✅ Pull requests are reviewed and merged promptly
- ✅ Merge conflicts are rare and resolved quickly
- ✅ Code quality remains high
- ✅ Both team members understand all parts of the project
- ✅ Communication is clear and frequent
- ✅ Work is divided fairly
- ✅ Deadlines are met
- ✅ Both team members are learning and growing

## 🎉 Tips for Success

1. **Communicate Constantly** - Over-communication is better than under-communication
2. **Review Frequently** - Don't let PRs sit for days
3. **Be Respectful** - Assume good intentions in all interactions
4. **Stay Organized** - Use issues, labels, and project boards
5. **Document Decisions** - Write down why you made certain choices
6. **Celebrate Wins** - Acknowledge completed milestones
7. **Learn Together** - Share knowledge and resources
8. **Be Patient** - Everyone makes mistakes and learns at different pace

## 📝 Quick Reference

### Branch Naming Convention
```
feature/description      # New feature
fix/description         # Bug fix
docs/description        # Documentation
refactor/description    # Code refactoring
test/description        # Tests
```

### Commit Message Format
```
type(scope): subject

Examples:
feat(queries): add monthly sales report query
fix(procedures): correct discount calculation
docs(readme): update installation instructions
```

### When to Pull Request
- Feature is complete and tested
- Documentation is updated
- Code follows style guide
- No sensitive data included
- You're ready for review

---

**Remember**: Good collaboration is about communication, respect, and shared responsibility. When in doubt, ask your collaborator!

For more detailed information, refer to:
- [CONTRIBUTING.md](./CONTRIBUTING.md) - Contribution guidelines
- [PROJECT_STRUCTURE.md](./PROJECT_STRUCTURE.md) - File organization
- [README.md](./README.md) - Project overview

---

**Last Updated**: 2025  
**Maintainers**: Avishek Biswas, Sreema Roy
