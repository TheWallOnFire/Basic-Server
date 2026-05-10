# PlanetScale

## Description
PlanetScale is a serverless MySQL-compatible database platform powered by Vitess, the same technology that scales YouTube's database. It brings Git-like branching workflows to database schema management.

## Key Features
- **Database Branching**: Create branches of your database schema, just like Git branches for code. Merge schema changes via Deploy Requests (like Pull Requests for your database).
- Serverless and auto-scaling — no connection pooling needed
- Non-blocking schema changes (no table locks during migrations)
- Built-in query insights and performance analytics
- MySQL wire protocol compatible

## How to code it
```javascript
// PlanetScale uses standard MySQL drivers
import mysql from 'mysql2/promise'

const connection = await mysql.createConnection(process.env.DATABASE_URL)

const [rows] = await connection.execute('SELECT * FROM users WHERE id = ?', [1])
console.log(rows)
```

## When to Use
- You want MySQL with Git-like schema branching
- You need zero-downtime schema migrations
- You want a serverless database that auto-scales
