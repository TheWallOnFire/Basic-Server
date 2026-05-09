# GitHub Actions

## Description
GitHub Actions is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your build, test, and deployment pipeline directly from your GitHub repository.

## How it works
GitHub Actions uses YAML files to define workflows. These workflows are triggered by specific events (like a `push` to a branch, a `pull_request`, or a schedule). When an event occurs, GitHub spins up a runner (a virtual machine or container), executes the defined jobs, and reports the results back directly on the pull request or commit page.

## How to code it
Here is a basic example of a GitHub Actions workflow (`.github/workflows/ci.yml`):

```yaml
name: Node.js CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: Use Node.js 18.x
      uses: actions/setup-node@v3
      with:
        node-version: 18.x
        cache: 'npm'
    - run: npm ci
    - run: npm run build --if-present
    - run: npm test
```

## Features it supports
- Fully integrated with GitHub
- Matrix builds to test across multiple OSs and versions simultaneously
- Secret management natively supported
- Reusable workflows and community actions marketplace
- Hosted runners provided by GitHub (Linux, Windows, macOS)

## Real projects about it
- **React**: The core React repository uses GitHub Actions for its extensive testing suite.
- **TensorFlow**: Uses GitHub Actions to handle complex CI matrix builds.
- **Vite**: Relies on Actions for its entire continuous integration process.
