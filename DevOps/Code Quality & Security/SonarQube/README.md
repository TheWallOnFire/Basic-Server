# SonarQube

## Description
SonarQube is an open-source platform for continuous inspection of code quality. It performs automatic reviews with static analysis to detect bugs, code smells, security vulnerabilities, and code duplications in 30+ programming languages.

## How it works
SonarQube runs a scanner on your codebase (triggered by CI/CD). The scanner sends analysis results to the SonarQube server, which processes them and displays a dashboard showing quality metrics, issues, and trends.

## How to set up
```bash
# Docker
docker run -d --name sonarqube -p 9000:9000 sonarqube:community

# Then open http://localhost:9000
# Default login: admin / admin
```

### CI Integration (GitHub Actions)
```yaml
- name: SonarQube Scan
  uses: SonarSource/sonarqube-scan-action@v2
  env:
    SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
    SONAR_HOST_URL: ${{ secrets.SONAR_HOST_URL }}
```

## Features it supports
- Static code analysis for 30+ languages
- Security vulnerability detection (OWASP Top 10)
- Code smell and technical debt tracking
- Test coverage visualization
- Quality Gates (pass/fail CI based on code quality thresholds)
- Pull request decoration (inline comments)
- Historical trend tracking
