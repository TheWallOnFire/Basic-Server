# Understanding the Dockerfile

A Dockerfile is a text document containing all the commands a user would call on the command line to assemble an image. Each instruction creates a **layer** in the image.

---

## Dockerfile Instruction Reference

### `FROM` — Base Image
Every Dockerfile starts with `FROM`. It defines the base image to build upon.
```dockerfile
FROM node:20-alpine
```
Always use specific tags (`:20-alpine`) instead of `:latest` for reproducible builds.

### `WORKDIR` — Set Working Directory
Sets the working directory for all subsequent instructions.
```dockerfile
WORKDIR /usr/src/app
```

### `COPY` — Copy Files
Copies files from your host machine into the image.
```dockerfile
COPY package*.json ./
COPY . .
```

### `ADD` — Copy + Extract
Like `COPY`, but can also extract tar archives and fetch URLs. Prefer `COPY` unless you need these features.

### `RUN` — Execute Commands
Runs a command during the **build** phase. Creates a new layer.
```dockerfile
RUN npm install
RUN apt-get update && apt-get install -y curl
```

### `CMD` — Default Command
The default command to run when a container starts. Only the **last** `CMD` takes effect.
```dockerfile
CMD ["node", "server.js"]
```

### `ENTRYPOINT` — Fixed Command
Similar to `CMD`, but harder to override. Use when the container should always run a specific executable.
```dockerfile
ENTRYPOINT ["python", "app.py"]
```

### `EXPOSE` — Document Ports
Documents which port the container listens on. Does NOT actually publish the port (you still need `-p` at runtime).
```dockerfile
EXPOSE 3000
```

### `ENV` — Environment Variables
Sets environment variables available during build and runtime.
```dockerfile
ENV NODE_ENV=production
```

### `ARG` — Build Arguments
Variables available only during the build phase (not at runtime).
```dockerfile
ARG VERSION=1.0
```

### `VOLUME` — Mount Point
Creates a mount point for persisting data.
```dockerfile
VOLUME /data
```

---

## Layer Caching (Critical for Performance!)

Docker caches each layer. If a layer hasn't changed, Docker reuses the cached version. **Order matters!**

### ❌ Bad (cache busted on every code change):
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY . .              # Any file change invalidates this layer
RUN npm install       # Must re-install every time!
CMD ["node", "server.js"]
```

### ✅ Good (dependencies cached separately):
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./ # Only changes when deps change
RUN npm install       # Cached if package.json didn't change!
COPY . .              # App code changes don't bust dep cache
CMD ["node", "server.js"]
```

---

## Multi-Stage Builds

Use multiple `FROM` statements to create smaller, production-ready images by discarding build dependencies.

```dockerfile
# Stage 1: Build
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production (only contains the built output)
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
CMD ["node", "dist/server.js"]
```
This produces a much smaller final image because dev dependencies and source code are left behind in the builder stage.
