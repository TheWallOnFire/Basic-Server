# Nginx

## Description
Nginx (pronounced "engine-x") is a high-performance web server, reverse proxy, load balancer, and HTTP cache. It is the most popular web server in the world, serving over 30% of all websites globally.

## How it works
Nginx uses an event-driven, asynchronous, non-blocking architecture. Unlike Apache (which spawns a thread per request), Nginx handles thousands of concurrent connections within a single worker process using an event loop, making it extremely memory-efficient.

## How to code it
```nginx
# /etc/nginx/nginx.conf — Reverse proxy for a Node.js app

http {
    # Upstream (backend servers)
    upstream api_backend {
        server 127.0.0.1:3000;
        server 127.0.0.1:3001;  # Load balance across 2 instances
    }

    server {
        listen 80;
        server_name example.com;

        # Redirect HTTP → HTTPS
        return 301 https://$host$request_uri;
    }

    server {
        listen 443 ssl http2;
        server_name example.com;

        ssl_certificate     /etc/ssl/certs/example.com.pem;
        ssl_certificate_key /etc/ssl/private/example.com.key;

        # Serve static files directly
        location /static/ {
            root /var/www/app;
            expires 30d;
        }

        # Proxy API requests to Node.js
        location /api/ {
            proxy_pass http://api_backend;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        # SPA fallback
        location / {
            root /var/www/app/dist;
            try_files $uri $uri/ /index.html;
        }
    }
}
```

## Features it supports
- Reverse proxy and load balancing
- SSL/TLS termination
- HTTP/2 and HTTP/3 (QUIC) support
- Static file serving with caching
- Rate limiting and connection throttling
- WebSocket proxying
- Gzip compression

## Real projects about it
- **Netflix**: Uses Nginx as their edge proxy serving billions of requests.
- **Cloudflare**: Built their edge network on Nginx.
- **WordPress.com**: Serves all traffic through Nginx.
