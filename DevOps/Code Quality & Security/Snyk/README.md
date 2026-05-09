# Snyk

## Description
Snyk is a developer-first security platform that helps teams find and fix vulnerabilities in their code, dependencies, containers, and infrastructure as code.

## Why Snyk?
- **Developer-Focused**: Provides fix suggestions and automated pull requests to update vulnerable packages.
- **Broad Coverage**: Scans Open Source dependencies, Static Code (SAST), Containers, and IaC (Terraform, K8s).
- **Fast**: Integrated directly into the CLI and IDE (VS Code, IntelliJ).
- **CI/CD Integration**: Can fail builds if high-severity vulnerabilities are found.

## How to use it (CLI)
```bash
# Authenticate
snyk auth

# Scan dependencies (npm, pip, maven, etc.)
snyk test

# Scan a Docker image
snyk container test my-app:latest

# Scan Infrastructure as Code (Terraform/K8s)
snyk iac test deployment.yaml

# Monitor a project for new vulnerabilities over time
snyk monitor
```

## Features
- Dependency graph analysis.
- License compliance checking.
- Integration with GitHub, GitLab, and Bitbucket.
- Vulnerability database updated daily.
