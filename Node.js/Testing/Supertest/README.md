# Supertest

## Description
Supertest is a library for testing HTTP servers in Node.js. It provides a high-level abstraction for sending HTTP requests to your Express/Fastify/Koa app and asserting the responses — without needing to start a real server.

## How to code it
```javascript
const request = require('supertest');
const app = require('../app'); // Your Express app

describe('GET /api/users', () => {
  it('should return all users', async () => {
    const res = await request(app)
      .get('/api/users')
      .set('Authorization', 'Bearer token123')
      .expect('Content-Type', /json/)
      .expect(200);

    expect(res.body).toHaveLength(3);
    expect(res.body[0]).toHaveProperty('name');
  });

  it('should create a user', async () => {
    const res = await request(app)
      .post('/api/users')
      .send({ name: 'Alice', email: 'alice@example.com' })
      .expect(201);

    expect(res.body.name).toBe('Alice');
  });
});
```

## Features
- No need to start a real server (binds to ephemeral port)
- Chainable assertion API
- Works with Jest, Mocha, Vitest
- Supports all HTTP methods and headers
