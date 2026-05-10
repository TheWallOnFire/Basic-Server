# SQLite

## Description
SQLite is a C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine. It is the most used database engine in the world.

## How it works
Unlike most other SQL databases, SQLite does not have a separate server process. It reads and writes directly to ordinary disk files. A complete SQL database with multiple tables, indices, triggers, and views, is contained in a single disk file.

## How to code it
Here is a basic example using Node.js and the `sqlite3` library:

```javascript
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database(':memory:'); // or './mydb.sqlite'

db.serialize(() => {
  db.run("CREATE TABLE user (id INT, info TEXT)");

  const stmt = db.prepare("INSERT INTO user VALUES (?, ?)");
  for (let i = 0; i < 10; i++) {
      stmt.run(i, `User ${i}`);
  }
  stmt.finalize();

  db.each("SELECT id, info FROM user", (err, row) => {
      console.log(row.id + ": " + row.info);
  });
});

db.close();
```

## Features it supports
- Serverless architecture (zero-configuration)
- Single-file database
- Full SQL capability
- ACID transactions
- Very small memory footprint

## Real projects about it
- **Mobile Apps**: Built into Android and iOS natively.
- **Web Browsers**: Used internally by Chrome, Safari, Firefox.
- **IoT & Embedded**: The default choice for smart TVs, set-top boxes, and automotive systems.
