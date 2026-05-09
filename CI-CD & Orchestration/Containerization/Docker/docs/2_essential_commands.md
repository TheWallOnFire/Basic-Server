# Docker Essential Commands

A complete cheat sheet of the most important Docker CLI commands you need to know.

---

## Image Commands

```bash
# Pull an image from Docker Hub
docker pull nginx:latest

# List all local images
docker images

# Build an image from a Dockerfile in the current directory
docker build -t my-app:1.0 .

# Build with a specific Dockerfile
docker build -f Dockerfile.prod -t my-app:prod .

# Remove an image
docker rmi my-app:1.0

# Remove all unused images
docker image prune -a
```

---

## Container Commands

```bash
# Run a container (foreground)
docker run nginx

# Run a container (detached / background)
docker run -d nginx

# Run with a name
docker run -d --name my-nginx nginx

# Run with port mapping (host:container)
docker run -d -p 8080:80 nginx

# Run with environment variables
docker run -d -e DB_HOST=localhost -e DB_PORT=5432 my-app

# Run with a volume mount
docker run -d -v /host/path:/container/path nginx

# List running containers
docker ps

# List ALL containers (including stopped)
docker ps -a

# Stop a running container
docker stop my-nginx

# Start a stopped container
docker start my-nginx

# Restart a container
docker restart my-nginx

# Remove a stopped container
docker rm my-nginx

# Force remove a running container
docker rm -f my-nginx

# Remove all stopped containers
docker container prune
```

---

## Inspection & Debugging

```bash
# View container logs
docker logs my-nginx

# Follow logs in real-time
docker logs -f my-nginx

# Execute a command inside a running container
docker exec -it my-nginx bash

# View container resource usage (CPU, Memory)
docker stats

# Inspect detailed container info (JSON)
docker inspect my-nginx

# View port mappings
docker port my-nginx
```

---

## Volume Commands

```bash
# Create a named volume
docker volume create my-data

# List all volumes
docker volume ls

# Inspect a volume
docker volume inspect my-data

# Remove a volume
docker volume rm my-data

# Remove all unused volumes
docker volume prune
```

---

## Network Commands

```bash
# List all networks
docker network ls

# Create a custom network
docker network create my-network

# Run a container on a specific network
docker run -d --name app --network my-network my-app

# Connect a running container to a network
docker network connect my-network my-container

# Inspect a network
docker network inspect my-network
```

---

## Cleanup Commands

```bash
# Remove ALL unused data (images, containers, volumes, networks)
docker system prune -a --volumes

# View disk usage
docker system df
```
