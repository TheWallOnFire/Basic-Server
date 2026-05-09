# Helmet

## Description
Helmet secures Express apps by setting various HTTP response headers. It's a collection of smaller middleware functions that set security headers to protect against common web vulnerabilities (XSS, clickjacking, sniffing, etc.).

## How to code it
```javascript
const helmet = require('helmet');

// Enable all default protections
app.use(helmet());

// Or configure individually
app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      defaultSrc: ["'self'"],
      scriptSrc: ["'self'", "https://cdn.example.com"],
      styleSrc: ["'self'", "'unsafe-inline'"],
    }
  },
  crossOriginEmbedderPolicy: false,
}));
```

### Headers Helmet Sets
| Header | Protection |
| :--- | :--- |
| `Content-Security-Policy` | Prevents XSS and data injection |
| `X-Content-Type-Options` | Prevents MIME sniffing |
| `X-Frame-Options` | Prevents clickjacking |
| `Strict-Transport-Security` | Forces HTTPS |
| `X-XSS-Protection` | Legacy XSS filter |
| `Referrer-Policy` | Controls referrer info |

## Features
- One-line security hardening
- Configurable per-header
- Used by 99% of production Express apps
