# Perfect Git Workflow Guide

## 🚀 Setup Complete!

Your repository is now configured with:
- ✅ **Husky** for Git hooks
- ✅ **Commitizen** for interactive commits
- ✅ **Commitlint** for conventional commits
- ✅ **Branch protection** via hooks
- ✅ **Git templates** for consistent commits

## 📋 Workflow Overview

```
master ←── qa ←── develop ←── feature/branch
   ↑        ↑        ↑           ↑
Production  QA    Integration  Development
```

## 🔄 Branch Strategy

### `master` (Production)
- **Protected**: No direct commits allowed
- **Source**: Only from `qa` branch via PR
- **Purpose**: Production-ready code
- **Triggers**: Production deployments

### `qa` (Quality Assurance)  
- **Protected**: Limited access
- **Source**: Only from `develop` branch via PR
- **Purpose**: Pre-production testing
- **Triggers**: QA environment deployments

### `develop` (Integration)
- **Source**: Feature branches via PR
- **Purpose**: Integration and development testing
- **Triggers**: Development environment deployments

### `feature/*` (Feature Development)
- **Source**: Branch from `develop`
- **Purpose**: Individual feature development
- **Lifecycle**: Merge back to `develop` when complete

## 💻 Daily Workflow

### 1. Start New Feature
\`\`\`bash
git checkout develop
git pull origin develop
git checkout -b feature/your-feature-name
\`\`\`

### 2. Make Changes and Commit
\`\`\`bash
# Stage your changes
git add .

# Use Commitizen for interactive commits
npm run commit

# Or use conventional commits manually
git commit -m "feat(terraform): add new AWS resource configuration"
\`\`\`

### 3. Push and Create PR
\`\`\`bash
git push origin feature/your-feature-name
# Create PR to develop branch on GitHub
\`\`\`

### 4. Release to QA
\`\`\`bash
# After features are merged to develop
git checkout qa
git pull origin qa
# Create PR: develop → qa
\`\`\`

### 5. Release to Production
\`\`\`bash
# After QA approval
git checkout master
git pull origin master
# Create PR: qa → master
\`\`\`

## 📝 Commit Types

| Type | Description | Example |
|------|-------------|---------|
| `feat` | New feature | `feat(aws): add S3 bucket configuration` |
| `fix` | Bug fix | `fix(terraform): resolve provider version conflict` |
| `docs` | Documentation | `docs(readme): update deployment instructions` |
| `style` | Code style | `style(terraform): format configuration files` |
| `refactor` | Code refactor | `refactor(modules): restructure VPC module` |
| `test` | Tests | `test(integration): add S3 deployment tests` |
| `chore` | Maintenance | `chore(deps): update terraform providers` |
| `ci` | CI/CD | `ci(github): add terraform validation workflow` |
| `infra` | Infrastructure | `infra(aws): configure new environment` |

## 🛡️ Protection Features

### Pre-commit Hooks
- ✅ Runs linting and tests
- ✅ Blocks direct commits to `master` and `qa`
- ✅ Validates code quality

### Commit Message Hooks
- ✅ Enforces conventional commit format
- ✅ Validates commit message structure
- ✅ Ensures consistent commit history

### Pre-push Hooks
- ✅ Blocks direct pushes to `master`
- ✅ Validates QA branch merge sources
- ✅ Enforces workflow rules

## 🚨 Emergency Procedures

### Hotfix Process
\`\`\`bash
# Create hotfix from master
git checkout master
git checkout -b hotfix/critical-fix

# Make fix and commit
git add .
npm run commit

# Merge back to master AND develop
git checkout master
git merge hotfix/critical-fix
git push origin master

git checkout develop
git merge hotfix/critical-fix
git push origin develop
\`\`\`

## 🎯 Next Steps

1. **Configure GitHub Branch Protection Rules** (see `.github/BRANCH_PROTECTION.md`)
2. **Set up CI/CD pipelines** for each branch
3. **Configure deployment triggers**
4. **Set up monitoring and notifications**

## 📚 Commands Reference

\`\`\`bash
# Interactive commit with Commitizen
npm run commit

# Validate commit message
npx commitlint --from HEAD~1 --to HEAD --verbose

# Check current branch
git branch --show-current

# View commit history with pretty format
git log --oneline --graph --decorate --all
\`\`\`
