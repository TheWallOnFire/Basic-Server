# PostgreSQL

## Description
PostgreSQL, also known as Postgres, is a free and open-source relational database management system emphasizing extensibility and SQL compliance. It is widely regarded as the most advanced open-source relational database.

## How it works
PostgreSQL is an object-relational database management system (ORDBMS). It uses a client/server model and handles concurrent requests using Multi-Version Concurrency Control (MVCC), which ensures that readers do not block writers and writers do not block readers, providing high performance in complex transactional environments.

## How to code it
Here is a basic example of querying PostgreSQL using Node.js and the `pg` library:

```javascript
const { Client } = require('pg');

const client = new Client({
  user: 'dbuser',
  host: 'localhost',
  database: 'mydb',
  password: 'secretpassword',
  port: 5432,
});

async function run() {
  await client.connect();
  const res = await client.query('SELECT $1::text as message', ['Hello World from Postgres!']);
  console.log(res.rows[0].message); // Hello World from Postgres!
  await client.end();
}

run();
```

## Features it supports
- Full ACID compliance
- Advanced data types (JSONB, Arrays, Hstore)
- Powerful indexing (B-tree, Multicolumn, Expressions, Partial)
- Geospatial support via PostGIS extension
- Complex queries, foreign keys, triggers, and views

## Real projects about it
- **Apple**: Uses PostgreSQL as the default database for its macOS Server.
- **Instagram**: Stores its massive datasets and user relationships in PostgreSQL.
- **Reddit**: Relies heavily on PostgreSQL to manage its data.
