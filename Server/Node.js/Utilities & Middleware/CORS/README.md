# CORS (cors)

## Description
`cors` is the standard middleware for enabling Cross-Origin Resource Sharing in Express. Without it, browsers block requests from a frontend (e.g., `localhost:3000`) to a backend on a different origin (e.g., `localhost:5000`).

## How to code it
```javascript
const cors = require('cors');

// Allow all origins (development)
app.use(cors());

// Production: whitelist specific origins
app.use(cors({
  origin: ['https://myapp.com', 'https://admin.myapp.com'],
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,  // Allow cookies
  maxAge: 86400       // Cache preflight for 24h
}));
```

## Features
- Simple one-liner for development
- Granular origin, method, and header control
- Credentials and cookie support
- Preflight caching
