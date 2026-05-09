# GitLab CI Quick Reference

## Pipeline Concepts

```
Pipeline → Stage 1 → Stage 2 → Stage 3
             │          │          │
           Job A      Job C      Job E
           Job B      Job D      Job F
           (parallel)  (parallel)  (parallel)
```

Jobs in the **same stage** run in parallel. Stages run **sequentially**.

## Key Keywords

| Keyword | Purpose |
| :--- | :--- |
| `stages` | Define pipeline stages and their order |
| `image` | Docker image to run the job in |
| `services` | Spin up service containers (DB, Redis) |
| `variables` | Define environment variables |
| `cache` | Cache files between pipeline runs |
| `artifacts` | Pass files between jobs within a pipeline |
| `before_script` | Commands to run before `script` |
| `script` | Main commands to execute |
| `after_script` | Commands to run after `script` (even on failure) |
| `only` / `rules` | Control when jobs run |
| `when` | `on_success`, `on_failure`, `manual`, `always` |
| `environment` | Link job to a deployment environment |
| `needs` | DAG — run jobs out of stage order based on dependencies |

## GitLab CI vs. GitHub Actions

| Feature | GitLab CI | GitHub Actions |
| :--- | :--- | :--- |
| **Config File** | `.gitlab-ci.yml` | `.github/workflows/*.yml` |
| **Runners** | Self-hosted or shared | GitHub-hosted or self-hosted |
| **Container Registry** | Built-in | GitHub Packages (GHCR) |
| **Environments** | Built-in with review apps | Via environments settings |
| **Secret Management** | CI/CD Variables | Repository Secrets |
| **DAG Support** | `needs` keyword | `needs` keyword |
| **Auto DevOps** | Yes (auto-detect & deploy) | No built-in equivalent |
