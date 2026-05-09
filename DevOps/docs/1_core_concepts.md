# CI/CD & Orchestration Core Concepts

## 1. What is CI/CD?
- **Continuous Integration (CI)**: Developers frequently merge code changes into a shared repository, where automated builds and tests verify every change.
- **Continuous Delivery (CD)**: Code changes are automatically prepared for release to production after passing CI.
- **Continuous Deployment**: An extension of CD where every change that passes CI is automatically deployed to production with no human intervention.

## 2. The CI/CD Pipeline
A typical pipeline consists of these stages:
```
Code Commit → Build → Unit Tests → Integration Tests → Deploy to Staging → Deploy to Production
```

## 3. Containers vs. Virtual Machines

| Feature | Containers (Docker) | Virtual Machines |
| :--- | :--- | :--- |
| **Isolation** | Process-level | Hardware-level |
| **Size** | Megabytes | Gigabytes |
| **Startup Time** | Seconds | Minutes |
| **Overhead** | Minimal (shares host kernel) | Heavy (runs full OS) |
| **Use Case** | Microservices, CI/CD | Legacy apps, full OS isolation |

## 4. Orchestration (Kubernetes)
When you have hundreds of containers, you need orchestration to manage them:
- **Scheduling**: Deciding which node runs which container.
- **Scaling**: Automatically increasing or decreasing the number of containers based on load.
- **Self-healing**: Restarting failed containers automatically.
- **Service Discovery**: Allowing containers to find and communicate with each other.

## 5. Infrastructure as Code (IaC)
Define your infrastructure in code files instead of manually configuring servers:
- **Terraform**: Cloud-agnostic IaC tool.
- **Docker Compose**: Define multi-container applications.
- **Kubernetes YAML**: Declare desired cluster state.

## 6. Key Terms Glossary
- **Image**: A read-only template for creating containers (e.g., a Docker image).
- **Container**: A running instance of an image.
- **Pod**: The smallest deployable unit in Kubernetes (one or more containers).
- **Service**: An abstraction in Kubernetes that defines a logical set of Pods and a policy to access them.
- **Ingress**: Manages external access (HTTP/HTTPS) to services in a Kubernetes cluster.
- **Helm**: A package manager for Kubernetes (like npm for K8s configurations).
