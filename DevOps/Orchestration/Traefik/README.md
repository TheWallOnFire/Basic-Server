# Traefik

## Description
Traefik is a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. It integrates with your existing infrastructure components (Docker, Swarm, Kubernetes, HashiCorp Nomad, etc.) and configures itself automatically and dynamically.

## How it works
Traefik listens to your orchestrator's API (e.g., Docker socket) and generates its configuration on the fly. When a new container starts, Traefik detects it and automatically creates a route for it.

## How to code it (Docker Compose)
```yaml
services:
  traefik:
    image: traefik:v2.10
    command:
      - "--api.insecure=true"
      - "--providers.docker=true"
      - "--entrypoints.web.address=:80"
    ports:
      - "80:80"
      - "8080:8080" # Dashboard
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock:ro"

  my-app:
    image: my-app:latest
    labels:
      - "traefik.http.routers.my-app.rule=Host(`my-app.localhost`)"
      - "traefik.http.services.my-app.loadbalancer.server.port=3000"
```

## Features
- **Dynamic Configuration**: No need to restart when services change.
- **Auto SSL**: Built-in integration with Let's Encrypt (ACME).
- **Dashboard**: Visual interface to see your routes and services.
- **Middleware**: Add authentication, rate limiting, and headers easily.
- **Cloud Native**: Designed specifically for containers and microservices.
