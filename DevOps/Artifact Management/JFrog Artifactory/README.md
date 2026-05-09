# JFrog Artifactory

## Description
JFrog Artifactory is a Universal Artifact Repository Manager. It serves as a central hub for all your software packages (Docker images, npm packages, Maven jars, Python wheels, etc.).

## Why it's essential
- **Consistency**: Ensures that the same version of a library is used across development, staging, and production.
- **Speed**: Caches remote dependencies locally, so you don't rely on the public internet (npm registry, Docker Hub) for every build.
- **Security**: Scans artifacts for vulnerabilities (integrated with JFrog Xray).
- **Traceability**: Keeps track of which build produced which artifact and where it was deployed.

## Supported Package Types
- Docker / Helm
- npm / Yarn
- Maven / Gradle
- PyPI (Python)
- NuGet (.NET)
- Go Modules
- Generic (any file)

## Usage in CI/CD
```bash
# Push a Docker image to Artifactory
docker tag my-app:latest my-artifactory.jfrog.io/docker-repo/my-app:latest
docker push my-artifactory.jfrog.io/docker-repo/my-app:latest
```
