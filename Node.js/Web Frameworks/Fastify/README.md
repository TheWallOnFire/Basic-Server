# Fastify

## Description
Fastify is a highly focused web framework for Node.js aiming to provide the best developer experience with the least overhead. It is inspired by Hapi and Express and is known as one of the fastest web frameworks in the Node ecosystem.

## How it works
Fastify is built around an encapsulated plugin architecture and a highly optimized router. It relies heavily on schema-based validation and serialization (using JSON Schema), which allows it to compile routes into highly performant functions under the hood, significantly reducing overhead.

## How to code it
Here is a basic example of a Fastify server:

```javascript
const fastify = require('fastify')({ logger: true });

// Declare a route
fastify.get('/', async (request, reply) => {
  return { hello: 'world from Fastify' };
});

// Run the server
const start = async () => {
  try {
    await fastify.listen({ port: 3000 });
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};
start();
```

## Features it supports
- 100% asynchronous and highly performant
- Extensible via its hook and plugin system
- Automatic JSON schema validation and serialization
- TypeScript ready
- Developer-friendly API with out-of-the-box logging
- Encapsulation to prevent cross-plugin contamination

## Real projects about it
- **Platformatic**: Built by the creator of Fastify, relying entirely on it for API generation.
- **Microsoft**: Uses Fastify in several of their modern Node.js services.
- **Vimeo**: Adopts Fastify for its high-throughput microservices.
