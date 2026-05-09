# PM2

## Description
PM2 is the most popular production process manager for Node.js. It keeps your app running forever, auto-restarts on crashes, provides built-in load balancing (cluster mode), and includes monitoring tools.

## How to code it
```bash
# Start an app
pm2 start app.js --name "api"

# Cluster mode (use all CPU cores)
pm2 start app.js -i max --name "api"

# View running processes
pm2 list

# Monitoring dashboard
pm2 monit

# View logs
pm2 logs api

# Restart / Stop / Delete
pm2 restart api
pm2 stop api
pm2 delete api

# Save process list for auto-startup on reboot
pm2 save
pm2 startup
```

### Ecosystem File (pm2.config.js)
```javascript
module.exports = {
  apps: [{
    name: 'api',
    script: './dist/server.js',
    instances: 'max',
    exec_mode: 'cluster',
    env: { NODE_ENV: 'development', PORT: 3000 },
    env_production: { NODE_ENV: 'production', PORT: 8080 },
    max_memory_restart: '300M',
    log_file: './logs/combined.log',
    error_file: './logs/error.log',
  }]
};
```

## Features
- Auto-restart on crash and file changes
- Cluster mode (load balance across CPU cores)
- Zero-downtime reloads (`pm2 reload`)
- Log management and rotation
- Startup script generation (auto-start on reboot)
- Built-in monitoring (CPU, memory, event loop lag)
