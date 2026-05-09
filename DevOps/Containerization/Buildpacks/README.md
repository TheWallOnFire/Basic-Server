# Cloud Native Buildpacks (CNB)

## Description
Buildpacks are a set of executable binaries that examine your source code and automatically package it into a production-ready Docker image, without the need for a `Dockerfile`.

## Why Buildpacks?
- **Zero Maintenance**: No more maintaining 100 different Dockerfiles.
- **Security**: Automatically applies security patches to the base OS and runtime without touching your code.
- **Compliance**: Ensures all images in your organization follow the same standards.
- **Efficiency**: Only rebuilds the layers that changed.

## How to use it (pack CLI)
```bash
# Build an image from source code (e.g., a Node.js or Python app)
pack build my-app:latest --builder gcr.io/buildpacks/builder:v1

# The tool automatically detects:
# 1. Language (Node.js)
# 2. Dependencies (package.json)
# 3. Start command (npm start)
# 4. Optimal base image
```

## Features
- Support for Node.js, Python, Java, Go, Ruby, and PHP.
- Integration with Kubernetes (via kpack).
- Reproducible builds.
- Bill of Materials (BOM) for auditing.
- Used by Heroku, Google Cloud, and VMware (Tanzu).
