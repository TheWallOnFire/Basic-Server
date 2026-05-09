# Pino

## Description
Pino is the fastest Node.js logger, focusing on low overhead and structured logging. It produces JSON logs by default and is the default logger for Fastify.

## How to code it
```javascript
const pino = require('pino');

const logger = pino({
  level: 'info',
  transport: {
    target: 'pino-pretty',   // Human-readable in development
    options: { colorize: true }
  }
});

logger.info('Server started');
logger.info({ userId: 123, action: 'login' }, 'User logged in');
logger.error({ err: new Error('DB failed') }, 'Database error');

// Express middleware
const pinoHttp = require('pino-http');
app.use(pinoHttp({ logger }));
```

## Features
- 5x faster than Winston (benchmark-proven)
- JSON output by default (perfect for ELK/Datadog)
- Child loggers with bound context
- Transports run in separate worker thread (non-blocking)
- `pino-pretty` for human-readable dev output
- Native Fastify integration
