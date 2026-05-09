# Husky & lint-staged

## Description
- **Husky**: Makes it easy to use Git hooks (pre-commit, pre-push) to run scripts.
- **lint-staged**: Runs linter/formatter only on the files that are staged in Git, making the process much faster.

## How to code it
```bash
# Install
npx husky-init && npm install
npm install -D lint-staged
```

```json
// package.json
{
  "scripts": {
    "prepare": "husky install"
  },
  "lint-staged": {
    "*.{js,ts}": "eslint --fix",
    "*.{js,ts,json,md}": "prettier --write"
  }
}
```

```bash
# .husky/pre-commit
npx lint-staged
```

## Why it's useful
- **Prevents "Bad" Commits**: You can't commit code that has linting errors.
- **Consistent Code**: Every commit is automatically formatted.
- **Speed**: Doesn't lint the whole project, only what you changed.
