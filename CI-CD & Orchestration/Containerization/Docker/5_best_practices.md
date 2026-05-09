# Docker Best Practices

## 1. Use Small Base Images
Prefer `alpine` variants to dramatically reduce image size and attack surface.
```dockerfile
# ❌ ~900MB
FROM node:20

# ✅ ~130MB
FROM node:20-alpine
```

## 2. Use `.dockerignore`
Prevent unnecessary files from being sent to the Docker build context. Create a `.dockerignore` file:
```
node_modules
.git
.env
*.md
dist
.DS_Store
```

## 3. One Process Per Container
Each container should run **one** process. Don't run your API server and database in the same container. Use Docker Compose to orchestrate multiple services.

## 4. Don't Run as Root
By default, containers run as root. Create a non-root user for security:
```dockerfile
FROM node:20-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
WORKDIR /app
COPY --chown=appuser:appgroup . .
```

## 5. Use Health Checks
Tell Docker how to verify your container is actually healthy:
```dockerfile
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1
```

## 6. Tag Images Properly
Never rely on `:latest` in production. Use semantic versioning:
```bash
docker build -t my-app:1.2.3 .
docker build -t my-app:1.2.3-alpine .
```

## 7. Minimize Layers
Combine related `RUN` commands to reduce layers:
```dockerfile
# ❌ Creates 3 layers
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get clean

# ✅ Creates 1 layer
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
```

## 8. Use Multi-Stage Builds
Keep production images lean by separating build and runtime stages (see doc 3).

## 9. Scan for Vulnerabilities
Regularly scan your images for known security vulnerabilities:
```bash
docker scout cves my-app:1.0
```

## 10. Use `docker compose watch` for Development
In modern Docker Compose, use `watch` for automatic sync and rebuild during development:
```yaml
services:
  app:
    build: .
    develop:
      watch:
        - action: sync
          path: ./src
          target: /app/src
        - action: rebuild
          path: package.json
```
