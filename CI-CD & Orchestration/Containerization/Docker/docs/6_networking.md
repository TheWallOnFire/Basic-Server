# Docker Networking Deep Dive

Understanding Docker networking is essential for building multi-container applications.

---

## Network Drivers

### 1. Bridge (Default)
The default network driver. Containers on the same bridge network can communicate via IP address. On user-defined bridge networks, they can also communicate by **container name**.
```bash
docker network create my-bridge
docker run -d --name api --network my-bridge my-api
docker run -d --name db --network my-bridge postgres
# 'api' can now reach 'db' by hostname: postgres://db:5432
```

### 2. Host
Removes network isolation. The container shares the host's network stack directly. No port mapping needed, but **no isolation**.
```bash
docker run --network host nginx
# Nginx is now accessible on host's port 80 directly
```

### 3. None
Completely disables networking for the container. Used for batch processing or security-sensitive tasks.
```bash
docker run --network none my-batch-job
```

### 4. Overlay
Used in Docker Swarm and Kubernetes. Enables communication between containers running on **different physical hosts**.

---

## Container DNS

On user-defined networks, Docker provides automatic DNS resolution. Each container can reach others using the container name as a hostname:
```
┌───────────────── my-network ─────────────────┐
│                                               │
│   ┌─────────┐         ┌─────────┐            │
│   │  app    │ ──────▶ │  db     │            │
│   │ :3000   │  "db"   │ :5432   │            │
│   └─────────┘         └─────────┘            │
│         │                                     │
│         │ "cache"      ┌─────────┐           │
│         └────────────▶ │ redis   │           │
│                        │ :6379   │           │
│                        └─────────┘           │
└───────────────────────────────────────────────┘
```

---

## Exposing Ports

```bash
# -p hostPort:containerPort
docker run -p 8080:80 nginx      # Host 8080 → Container 80
docker run -p 127.0.0.1:8080:80  # Only accessible from localhost
docker run -P nginx              # Map ALL exposed ports to random host ports
```

---

## Common Patterns

### Isolating Frontend and Backend
```yaml
# docker-compose.yml
services:
  frontend:
    networks: [frontend-net]
  
  backend:
    networks: [frontend-net, backend-net]
  
  database:
    networks: [backend-net]      # NOT accessible from frontend!

networks:
  frontend-net:
  backend-net:
```
This ensures the frontend can talk to the backend, but **cannot** directly access the database.
