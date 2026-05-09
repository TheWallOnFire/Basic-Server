# Jenkins Quick Reference

## Pipeline Types

### Declarative Pipeline (Recommended)
Structured, opinionated syntax. Easier to read and write.
```groovy
pipeline {
    agent any
    stages {
        stage('Build') { steps { sh 'make' } }
    }
}
```

### Scripted Pipeline
Full Groovy scripting power. More flexible but harder to maintain.
```groovy
node {
    stage('Build') {
        sh 'make'
    }
}
```

## Key Directives

| Directive | Purpose |
| :--- | :--- |
| `agent` | Where to run (any node, specific label, Docker container) |
| `stages` / `stage` | Logical groups of steps |
| `steps` | Actual commands to execute |
| `environment` | Set environment variables |
| `tools` | Auto-install tools (Node, Maven, etc.) |
| `when` | Conditional execution (`branch 'main'`, `expression { }`) |
| `input` | Pause for manual approval |
| `post` | Actions after pipeline (`always`, `success`, `failure`) |
| `parallel` | Run stages concurrently |
| `options` | Pipeline-level options (`timeout`, `retry`, `timestamps`) |

## Useful Plugins
- **Blue Ocean** — Modern, visual pipeline UI.
- **Pipeline** — Core pipeline support.
- **Docker Pipeline** — Build/push Docker images in pipelines.
- **Credentials Binding** — Safely inject secrets.
- **Slack Notification** — Send alerts to Slack channels.
- **JUnit** — Parse and display test results.
- **HTML Publisher** — Publish HTML reports (coverage, docs).
