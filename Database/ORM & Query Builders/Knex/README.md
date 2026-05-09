# Knex.js

## Description
Knex.js is a "batteries included" SQL query builder for Node.js. It is not a full ORM — it sits one level below, providing a flexible, chainable API for constructing SQL queries without writing raw strings.

## How it works
Knex generates SQL queries via a JavaScript builder pattern. You chain methods like `.select()`, `.where()`, `.join()` to construct your query, and Knex compiles it into the appropriate SQL dialect. Many ORMs (like Bookshelf.js and Objection.js) are built on top of Knex.

## How to code it

```javascript
const knex = require('knex')({
  client: 'pg',
  connection: { host: 'localhost', user: 'admin', password: 'secret', database: 'mydb' }
});

// Select
const users = await knex('users').select('*');

// Where
const alice = await knex('users').where({ email: 'alice@example.com' }).first();

// Insert
await knex('users').insert({ name: 'Alice', email: 'alice@example.com' });

// Update
await knex('users').where({ id: 1 }).update({ name: 'Bob' });

// Join
const results = await knex('users')
  .join('posts', 'users.id', 'posts.author_id')
  .select('users.name', 'posts.title');

// Raw SQL escape hatch
const raw = await knex.raw('SELECT * FROM users WHERE id = ?', [1]);
```

## Features it supports
- Chainable query builder API
- Migration and seed system
- Transaction support
- Connection pooling (via `tarn.js`)
- Multi-dialect support

## Supported Databases
PostgreSQL, MySQL, MariaDB, SQLite, Oracle, Amazon Redshift, MS SQL Server
