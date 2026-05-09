# Swagger / OpenAPI (swagger-jsdoc + swagger-ui-express)

## Description
Swagger (OpenAPI) is the industry standard for documenting REST APIs. In Node.js, `swagger-jsdoc` generates OpenAPI specs from JSDoc comments, and `swagger-ui-express` serves an interactive API documentation page.

## How to code it
```javascript
const swaggerJsdoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

const options = {
  definition: {
    openapi: '3.0.0',
    info: { title: 'My API', version: '1.0.0' },
    servers: [{ url: 'http://localhost:3000' }],
  },
  apis: ['./routes/*.js'],
};

const specs = swaggerJsdoc(options);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(specs));

// In your route file:
/**
 * @openapi
 * /api/users:
 *   get:
 *     summary: Get all users
 *     responses:
 *       200:
 *         description: A list of users
 */
app.get('/api/users', (req, res) => { /* ... */ });
```

## Features
- Auto-generated interactive API docs
- Try-it-out functionality (test endpoints from the browser)
- Export OpenAPI spec as JSON/YAML
- Code generation for client SDKs
