# Quick Start Guide - Working with Your Friend

New to this project? Follow these steps to start collaborating immediately!

## ⚡ 5-Minute Setup

### Step 1: Get Repository Access
Ask the repository owner to add you as a collaborator at:
```
https://github.com/xer0Xavishek/370DBMS/settings/access
```

### Step 2: Clone and Setup
```bash
# Clone the repository
git clone https://github.com/xer0Xavishek/370DBMS.git
cd 370DBMS

# Configure your Git identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 3: Install Database System
- Install MySQL, PostgreSQL, or your preferred DBMS
- Install a SQL client (MySQL Workbench, pgAdmin, DBeaver, etc.)

### Step 4: Start Working
```bash
# Always pull latest changes first
git pull origin main

# Create a new branch for your work
git checkout -b feature/your-feature-name

# Make your changes, then:
git add .
git commit -m "feat: description of your changes"
git push origin feature/your-feature-name
```

### Step 5: Create Pull Request
Go to: `https://github.com/xer0Xavishek/370DBMS/pulls`
- Click "New Pull Request"
- Select your branch
- Add description and request review

## 🎯 Daily Workflow (3 Commands)

```bash
# 1. Start with latest code
git pull origin main

# 2. Create a branch
git checkout -b feature/my-work

# 3. After making changes
git add .
git commit -m "your message"
git push origin feature/my-work
```

## 📚 Important Files to Read

1. **[COLLABORATION_GUIDE.md](./COLLABORATION_GUIDE.md)** - Complete collaboration instructions
2. **[CONTRIBUTING.md](./CONTRIBUTING.md)** - Coding standards and guidelines
3. **[PROJECT_STRUCTURE.md](./PROJECT_STRUCTURE.md)** - Where to put your files
4. **[README.md](./README.md)** - Project overview

## 💡 Pro Tips

- **Communicate constantly** - Tell your friend what you're working on
- **Pull often** - Run `git pull origin main` multiple times a day
- **Small commits** - Commit small changes frequently
- **Test everything** - Run your SQL before committing
- **Ask questions** - Use GitHub issues for questions

## 🆘 Common Problems

### "I have merge conflicts!"
```bash
# Don't panic! Edit the conflicted files, then:
git add .
git commit -m "merge: resolve conflicts"
git push origin your-branch-name
```

### "I committed the wrong file!"
```bash
# Before pushing:
git reset --soft HEAD~1

# After pushing (creates new commit):
git revert HEAD
git push origin your-branch-name
```

### "I'm confused!"
- Read [COLLABORATION_GUIDE.md](./COLLABORATION_GUIDE.md) for detailed help
- Create an issue on GitHub
- Ask your collaborator

## ✅ Quick Checklist

Before starting work:
- [ ] Pull latest changes
- [ ] Create new branch
- [ ] Understand the task

While working:
- [ ] Follow coding standards
- [ ] Test your changes
- [ ] Commit regularly

Before pull request:
- [ ] Test everything works
- [ ] Update documentation
- [ ] Write clear PR description

## 🎓 Need More Help?

See the full [COLLABORATION_GUIDE.md](./COLLABORATION_GUIDE.md) for:
- Detailed Git commands
- Handling complex scenarios
- Best practices
- Learning resources

---

**Remember**: When in doubt, communicate with your collaborator!
