# Caddy

## Description
Caddy is a powerful, enterprise-ready, open-source web server with automatic HTTPS written in Go.

## Why Caddy?
- **Automatic HTTPS**: Provisions and renews SSL certificates from Let's Encrypt or ZeroSSL automatically.
- **Simple Config**: Uses a clean, human-readable format called the Caddyfile.
- **Modern**: Supports HTTP/3 by default.
- **Static Binaries**: Single file, easy to deploy.

## How to code it (Caddyfile)
```caddyfile
# Automatic HTTPS for your domain
example.com {
    # Reverse proxy to your backend
    reverse_proxy localhost:3000

    # Serve static files
    root * /var/www/html
    file_server

    # Compression
    encode gzip
}
```

## Features
- Virtual hosting (multiple domains on one server).
- Load balancing and health checks.
- Markdown rendering.
- API-driven configuration.
- Extensible via Go plugins.
