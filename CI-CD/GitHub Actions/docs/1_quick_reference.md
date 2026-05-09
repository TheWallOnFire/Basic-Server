# GitHub Actions Quick Reference

## Workflow Structure
```yaml
name: CI                    # Workflow name (shown in GitHub UI)
on: [push, pull_request]    # Trigger events
jobs:
  build:                    # Job name
    runs-on: ubuntu-latest  # Runner OS
    steps:                  # Sequence of tasks
      - uses: actions/checkout@v4
      - run: npm test
```

## Common Triggers (`on:`)

| Trigger | Description |
| :--- | :--- |
| `push` | On code push to specified branches |
| `pull_request` | On PR open/update to specified branches |
| `schedule` | Cron-based schedule (`cron: '0 0 * * *'`) |
| `workflow_dispatch` | Manual trigger from GitHub UI |
| `release` | When a GitHub Release is published |

## Key Features

### Matrix Strategy
Test across multiple versions/platforms simultaneously:
```yaml
strategy:
  matrix:
    node-version: [18, 20, 22]
    os: [ubuntu-latest, windows-latest]
```

### Service Containers
Spin up databases/services for testing:
```yaml
services:
  postgres:
    image: postgres:16
    ports: ['5432:5432']
```

### Secrets
Access repo/org secrets securely:
```yaml
${{ secrets.MY_SECRET }}
```

### Artifacts
Upload/download files between jobs:
```yaml
- uses: actions/upload-artifact@v4
  with:
    name: build-output
    path: dist/
```

### Job Dependencies
```yaml
jobs:
  test:
    ...
  deploy:
    needs: test  # Runs only after 'test' passes
```

### Environments
Define environments (staging, production) with protection rules and manual approvals in GitHub Settings → Environments.

## Popular Community Actions
- `actions/checkout` — Clone your repo
- `actions/setup-node` — Install Node.js
- `actions/setup-python` — Install Python
- `actions/cache` — Cache dependencies
- `docker/build-push-action` — Build & push Docker images
- `appleboy/ssh-action` — Deploy via SSH
- `codecov/codecov-action` — Upload code coverage
