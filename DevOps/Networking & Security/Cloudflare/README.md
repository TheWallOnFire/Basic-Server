# Cloudflare

## Description
Cloudflare is a global network designed to make everything you connect to the internet secure, private, fast, and reliable. It acts as a Reverse Proxy, CDN, and Security layer in front of your website.

## Key Services
- **CDN (Content Delivery Network)**: Caches your static content (images, JS, CSS) on 300+ edge locations worldwide for faster loading.
- **WAF (Web Application Firewall)**: Protects your site from SQL injection, XSS, and bot attacks.
- **DDoS Protection**: Absorbs massive volumetric attacks before they reach your server.
- **DNS**: One of the fastest and most secure DNS services in the world (1.1.1.1).
- **Cloudflare Workers**: Serverless code that runs on the "edge," close to your users.
- **Tunnels**: Securely expose your local development server to the internet without opening ports on your router.

## How to use it (Cloudflare Tunnel)
```bash
# Install cloudflared
# Create a tunnel
cloudflared tunnel create my-dev-server

# Route traffic to your tunnel
cloudflared tunnel route dns my-dev-server dev.example.com

# Run the tunnel
cloudflared tunnel run --url localhost:3000 my-dev-server
```

## Features
- Automatic SSL/TLS encryption.
- Image optimization (Polish/Mirage).
- Bot management and CAPTCHA-less challenges.
- Zero Trust security for internal applications.
