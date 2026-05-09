# GitHub Actions — Configuration & Setup Guide

## 1. Where Workflows Live
All workflow files must be placed inside your repository at:
```
.github/
└── workflows/
    ├── ci.yml
    ├── deploy.yml
    └── release.yml
```
GitHub automatically detects and runs any `.yml` file in this directory.

---

## 2. Workflow Anatomy (Detailed)

```yaml
name: CI Pipeline                     # Display name in GitHub UI

on:                                   # TRIGGER: When should this run?
  push:
    branches: [main, develop]
    paths:                            # Only run when these files change
      - 'src/**'
      - 'package.json'
    paths-ignore:                     # Skip when only these change
      - '**.md'
      - 'docs/**'
  pull_request:
    branches: [main]
    types: [opened, synchronize, reopened]
  schedule:
    - cron: '0 6 * * 1'              # Every Monday at 6 AM UTC
  workflow_dispatch:                  # Manual trigger button
    inputs:
      environment:
        description: 'Target environment'
        required: true
        default: 'staging'
        type: choice
        options: [staging, production]

concurrency:                          # Cancel in-progress runs for same branch
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

env:                                  # Global environment variables
  NODE_VERSION: '20'
  REGISTRY: ghcr.io

permissions:                          # Least-privilege token permissions
  contents: read
  packages: write

jobs:
  my-job:
    name: Build & Test
    runs-on: ubuntu-latest            # Runner OS
    timeout-minutes: 15               # Fail if job takes too long
    steps:
      - uses: actions/checkout@v4     # Step using a community action
      - run: echo "Hello"            # Step running a shell command
```

---

## 3. Secrets Management

### Setting Secrets
`Repository → Settings → Secrets and variables → Actions → New repository secret`

### Using Secrets
```yaml
env:
  API_KEY: ${{ secrets.API_KEY }}

steps:
  - run: curl -H "Authorization: Bearer $API_KEY" https://api.example.com
```

### Environment-Level Secrets
Create separate environments (`staging`, `production`) with their own secrets:
`Repository → Settings → Environments → New environment`

```yaml
jobs:
  deploy:
    environment: production     # Uses secrets from 'production' environment
    steps:
      - run: deploy --token ${{ secrets.DEPLOY_TOKEN }}
```

---

## 4. Caching Dependencies

### npm
```yaml
- uses: actions/setup-node@v4
  with:
    node-version: 20
    cache: 'npm'                # Automatic caching of ~/.npm
```

### pip
```yaml
- uses: actions/setup-python@v5
  with:
    python-version: '3.12'
    cache: 'pip'                # Automatic caching
```

### Custom Cache
```yaml
- uses: actions/cache@v4
  with:
    path: |
      ~/.cargo/registry
      ~/.cargo/git
      target/
    key: ${{ runner.os }}-cargo-${{ hashFiles('**/Cargo.lock') }}
    restore-keys: |
      ${{ runner.os }}-cargo-
```

---

## 5. Job Outputs & Dependencies

Pass data between jobs:
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    outputs:
      version: ${{ steps.version.outputs.value }}
    steps:
      - id: version
        run: echo "value=$(cat VERSION)" >> $GITHUB_OUTPUT

  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - run: echo "Deploying version ${{ needs.build.outputs.version }}"
```

---

## 6. Branch Protection Rules

For production-grade repositories, configure branch protection:

`Repository → Settings → Branches → Add rule`

- [x] Require pull request reviews before merging
- [x] Require status checks to pass before merging (select your CI job)
- [x] Require branches to be up to date before merging
- [x] Do not allow bypassing the above settings
