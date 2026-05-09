# Hapi

## Description
Hapi is a rich, configuration-centric framework for building applications and services in Node.js. Originally developed at Walmart, it enables developers to focus on writing reusable application logic instead of spending time building infrastructure.

## How it works
Hapi emphasizes security, robustness, and stability over pure micro-benchmarked speed. It works by having developers configure a server with plugins and routes. Everything in Hapi is heavily encapsulated, and it has an extensive built-in authorization and validation mechanism (using Joi).

## How to code it
Here is a basic example of a Hapi server:

```javascript
const Hapi = require('@hapi/hapi');

const init = async () => {
    const server = Hapi.server({
        port: 3000,
        host: 'localhost'
    });

    server.route({
        method: 'GET',
        path: '/',
        handler: (request, h) => {
            return 'Hello World from Hapi!';
        }
    });

    await server.start();
    console.log('Server running on %s', server.info.uri);
};

process.on('unhandledRejection', (err) => {
    console.log(err);
    process.exit(1);
});

init();
```

## Features it supports
- Configuration-driven architecture
- Extremely secure out of the box
- Built-in input validation via `Joi`
- Advanced routing features
- Powerful plugin system
- Robust caching mechanisms

## Real projects about it
- **Walmart**: Originally developed Hapi to handle Black Friday traffic.
- **Disney**: Uses Hapi for numerous backend services.
- **Macy's**: Rebuilt their e-commerce backend using Hapi.
