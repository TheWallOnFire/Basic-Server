# Docker Compose

Docker Compose is a tool for defining and running **multi-container** Docker applications. Instead of running multiple `docker run` commands with long arguments, you define everything in a single `docker-compose.yml` file.

---

## Why Docker Compose?

Imagine you need to run:
- A Node.js API server
- A PostgreSQL database
- A Redis cache

Without Compose, you'd run 3 separate `docker run` commands with networking, volumes, and environment variables. With Compose, it's one file and one command: `docker compose up`.

---

## docker-compose.yml Structure

```yaml
version: '3.8'                  # Compose file format version

services:                        # Define your containers
  app:                           # Service name (becomes hostname)
    build: .                     # Build from Dockerfile in current dir
    ports:
      - "3000:3000"              # host:container port mapping
    environment:
      - NODE_ENV=development
      - DB_HOST=db               # Reference other service by name!
      - REDIS_HOST=cache
    volumes:
      - .:/app                   # Bind mount for live reload
      - /app/node_modules        # Anonymous volume to preserve node_modules
    depends_on:
      - db
      - cache

  db:                            # PostgreSQL service
    image: postgres:16-alpine
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER=admin
      - POSTGRES_PASSWORD=secret
      - POSTGRES_DB=myapp
    volumes:
      - postgres_data:/var/lib/postgresql/data   # Named volume for persistence

  cache:                         # Redis service
    image: redis:7-alpine
    ports:
      - "6379:6379"

volumes:                         # Declare named volumes
  postgres_data:
```

---

## Essential Compose Commands

```bash
# Start all services (foreground)
docker compose up

# Start all services (detached)
docker compose up -d

# Start and rebuild images
docker compose up -d --build

# Stop all services
docker compose down

# Stop and remove volumes (WARNING: deletes data!)
docker compose down -v

# View logs
docker compose logs

# Follow logs for a specific service
docker compose logs -f app

# List running services
docker compose ps

# Execute a command in a running service
docker compose exec app sh

# Scale a service (run multiple instances)
docker compose up -d --scale app=3
```

---

## Key Concepts

### `depends_on`
Controls startup order. In the example above, `db` and `cache` start before `app`. However, it does **not** wait for the service to be "ready" — only for the container to start.

### Networking
Compose automatically creates a network for all services. Each service can reference others by their **service name** as a hostname.
```
app can connect to db using: postgres://admin:secret@db:5432/myapp
app can connect to cache using: redis://cache:6379
```

### Volumes
- **Bind Mounts** (`.:/app`): Maps a host directory into the container. Great for development (live reload).
- **Named Volumes** (`postgres_data:/var/lib/...`): Managed by Docker. Data persists even if the container is removed.
