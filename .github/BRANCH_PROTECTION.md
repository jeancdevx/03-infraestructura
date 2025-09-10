# Git Workflow Configuration

## Branch Protection Rules
# This should be configured in GitHub Settings > Branches

### Master Branch
- Require pull request reviews before merging
- Require status checks to pass before merging
- Require branches to be up to date before merging
- Require linear history
- Do not allow force pushes
- Do not allow deletions

### QA Branch  
- Require pull request reviews before merging
- Require status checks to pass before merging
- Require branches to be up to date before merging
- Allow force pushes (for hotfixes if needed)

### Develop Branch
- Require pull request reviews before merging
- Require status checks to pass before merging

## Workflow Rules
1. **Feature Development**: Create feature branches from `develop`
2. **Testing**: Merge feature branches to `develop` via PR
3. **QA Testing**: Merge `develop` to `qa` via PR
4. **Production**: Merge `qa` to `master` via PR
5. **Hotfixes**: Create from `master`, merge back to `master` and `develop`
