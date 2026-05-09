# GitHub Actions — Advanced Patterns

## 1. Reusable Workflows (DRY Pipelines)

Define a workflow once and call it from multiple repositories.

### The Reusable Workflow (`.github/workflows/reusable-deploy.yml`)
```yaml
name: Reusable Deploy

on:
  workflow_call:
    inputs:
      environment:
        required: true
        type: string
      image-tag:
        required: true
        type: string
    secrets:
      SSH_KEY:
        required: true
      SERVER_HOST:
        required: true

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: ${{ inputs.environment }}
    steps:
      - uses: appleboy/ssh-action@v1
        with:
          host: ${{ secrets.SERVER_HOST }}
          username: deploy
          key: ${{ secrets.SSH_KEY }}
          script: |
            docker pull ${{ inputs.image-tag }}
            docker compose up -d
```

### Calling It
```yaml
jobs:
  deploy-staging:
    uses: ./.github/workflows/reusable-deploy.yml
    with:
      environment: staging
      image-tag: ghcr.io/org/app:latest
    secrets:
      SSH_KEY: ${{ secrets.STAGING_SSH_KEY }}
      SERVER_HOST: ${{ secrets.STAGING_HOST }}
```

---

## 2. Composite Actions (Reusable Steps)

Bundle multiple steps into a single, shareable action.

### Define (`.github/actions/setup-project/action.yml`)
```yaml
name: Setup Project
description: Install deps and setup env
inputs:
  node-version:
    default: '20'
runs:
  using: composite
  steps:
    - uses: actions/setup-node@v4
      with:
        node-version: ${{ inputs.node-version }}
        cache: 'npm'
    - run: npm ci
      shell: bash
    - run: cp .env.example .env
      shell: bash
```

### Use
```yaml
steps:
  - uses: actions/checkout@v4
  - uses: ./.github/actions/setup-project
    with:
      node-version: '22'
  - run: npm test
```

---

## 3. Dynamic Matrix from JSON

Generate matrix values dynamically:
```yaml
jobs:
  prepare:
    runs-on: ubuntu-latest
    outputs:
      services: ${{ steps.set.outputs.services }}
    steps:
      - uses: actions/checkout@v4
      - id: set
        run: |
          echo "services=$(ls packages/ | jq -R -s -c 'split("\n") | map(select(. != ""))')" >> $GITHUB_OUTPUT

  build:
    needs: prepare
    strategy:
      matrix:
        service: ${{ fromJSON(needs.prepare.outputs.services) }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Building ${{ matrix.service }}"
```

---

## 4. Conditional Deployment with Approvals

```yaml
jobs:
  deploy-prod:
    runs-on: ubuntu-latest
    environment:
      name: production
      url: https://app.example.com
    # In GitHub Settings → Environments → production:
    #   ✅ Required reviewers: @team-lead, @devops
    #   ✅ Wait timer: 5 minutes
    #   ✅ Deployment branches: main only
    steps:
      - run: echo "Deploying after manual approval..."
```

---

## 5. Debugging Workflows

### Enable Debug Logging
Add this secret to your repository:
```
ACTIONS_STEP_DEBUG = true
```
All subsequent runs will output verbose step-by-step logs.

### SSH into a Runner (for debugging)
```yaml
- name: Debug via SSH
  uses: mxschmitt/action-tmate@v3
  if: failure()     # Only SSH in if something failed
  timeout-minutes: 15
```
