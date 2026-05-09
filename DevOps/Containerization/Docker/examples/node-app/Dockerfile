# Example: Dockerizing a Node.js Express App
# This Dockerfile follows best practices from docs/5_best_practices.md

# --- Stage 1: Build ---
FROM node:20-alpine AS builder
WORKDIR /app

# Install dependencies first (layer caching optimization)
COPY package*.json ./
RUN npm ci --only=production

# Copy source code
COPY . .

# --- Stage 2: Production ---
FROM node:20-alpine

# Create non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copy only production artifacts from builder
COPY --from=builder --chown=appuser:appgroup /app ./

# Switch to non-root user
USER appuser

# Document the port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

# Start the application
CMD ["node", "server.js"]
