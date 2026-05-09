# Example: Dockerizing a Go Gin App
# Go produces a single static binary, making it perfect for minimal Docker images.

# --- Stage 1: Build ---
FROM golang:1.22-alpine AS builder
WORKDIR /app

# Download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Build the binary
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /server .

# --- Stage 2: Production ---
# scratch is a completely empty image (0 bytes!)
FROM scratch

# Copy the binary from builder
COPY --from=builder /server /server

EXPOSE 8080

ENTRYPOINT ["/server"]
