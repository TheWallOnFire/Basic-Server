# Winston

## Description
Winston is the most popular logging library for Node.js. It supports multiple log levels, transports (console, file, HTTP, database), and custom formatting.

## How to code it
```javascript
const winston = require('winston');

const logger = winston.createLogger({
  level: 'info',
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.errors({ stack: true }),
    winston.format.json()
  ),
  defaultMeta: { service: 'user-service' },
  transports: [
    new winston.transports.File({ filename: 'logs/error.log', level: 'error' }),
    new winston.transports.File({ filename: 'logs/combined.log' }),
  ],
});

if (process.env.NODE_ENV !== 'production') {
  logger.add(new winston.transports.Console({
    format: winston.format.combine(winston.format.colorize(), winston.format.simple())
  }));
}

logger.info('Server started', { port: 3000 });
logger.error('Database connection failed', { host: 'localhost' });
```

## Features
- Multiple log levels (error, warn, info, http, verbose, debug, silly)
- Multiple transports (console, file, HTTP, MongoDB, Redis)
- Custom formatting (JSON, colorized, printf)
- Log rotation via `winston-daily-rotate-file`
- Child loggers with inherited metadata
