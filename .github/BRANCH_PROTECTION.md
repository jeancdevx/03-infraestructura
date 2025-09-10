# Git Workflow Configuration

## Branch Protection Rules

### Master Branch
- Require pull request reviews before merging
- Require branches to be up to date before merging
- Require linear history
- Do not allow force pushes
- Do not allow deletions

### QA Branch  
- Require pull request reviews before merging
- Require branches to be up to date before merging

### Develop Branch
- Require pull request reviews before merging

## Workflow Rules
1. **Feature Development**: Create feature branches from `develop`
2. **Testing**: Merge feature branches to `develop` via PR
3. **QA Testing**: Merge `develop` to `qa` via PR
4. **Production**: Merge `qa` to `master` via PR
5. **Hotfixes**: Create from `master`, merge back to `master` and `develop`
