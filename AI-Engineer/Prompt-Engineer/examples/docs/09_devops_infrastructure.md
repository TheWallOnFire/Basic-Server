# DevOps & Infrastructure Prompts

Real-world, copy-paste-ready prompts for DevOps tasks. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Write a Dockerfile

❌ **Weak Prompt**:
```
Write a Dockerfile for my Node.js app.
```

✅ **Strong Prompt**:
```
Write a production-optimized, multi-stage Dockerfile for a Node.js 20 
application using TypeScript.

Requirements:
- Stage 1 (builder): Install deps, compile TypeScript
- Stage 2 (production): Copy only compiled JS and production deps
- Use alpine base images for minimal size
- Run as non-root user (node:node)
- Set NODE_ENV=production
- Use .dockerignore best practices (list what should be in it)
- Health check endpoint: GET /health on port 3000
- Handle SIGTERM gracefully (use dumb-init or tini)

Add comments explaining WHY each optimization matters.
Expected final image size: < 150MB

Also provide:
- The .dockerignore file
- The docker-compose.yml for local development (with hot-reload via volumes)
```

---

## Example 2 — Write a CI/CD Pipeline

❌ **Weak Prompt**:
```
Create a GitHub Actions workflow.
```

✅ **Strong Prompt**:
```
Create a GitHub Actions CI/CD workflow for a Node.js monorepo with these stages:

1. **Lint & Format Check** (runs on all PRs)
   - ESLint + Prettier check
   - Fail fast if issues found

2. **Test** (runs on all PRs)
   - Unit tests with Jest (with coverage report)
   - Integration tests with a PostgreSQL service container
   - Upload coverage to artifacts

3. **Build & Push** (runs on merge to main)
   - Build Docker image with multi-stage build
   - Tag with git SHA and "latest"
   - Push to GitHub Container Registry (ghcr.io)

4. **Deploy** (runs on merge to main, after build)
   - Deploy to staging automatically
   - Deploy to production only with manual approval

Include:
- Caching for node_modules and Docker layers
- Concurrency control (cancel in-progress runs on new push)
- Environment secrets for database URL and registry credentials
- Status badge markdown for the README
```
