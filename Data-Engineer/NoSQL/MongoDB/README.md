# MongoDB

## Description
MongoDB is a source-available, cross-platform, document-oriented NoSQL database program. Instead of storing data in tables and rows as in a relational database, it stores data in JSON-like documents with dynamic schemas (BSON).

## How it works
MongoDB organizes data into Collections (equivalent to tables) and Documents (equivalent to rows). Each document can have a different structure. It uses an internal storage engine (WiredTiger) to write data to disk and relies on memory-mapped files to optimize read/write performance. It achieves high availability and horizontal scaling via Replica Sets and Sharding.

## How to code it
Here is a basic example using the official Node.js driver to connect and insert data:

```javascript
const { MongoClient } = require("mongodb");

const uri = "mongodb://localhost:27017";
const client = new MongoClient(uri);

async function run() {
  try {
    await client.connect();
    const database = client.db('test_db');
    const users = database.collection('users');
    
    // Insert a document
    const result = await users.insertOne({ name: "Alice", role: "admin" });
    console.log(`Document inserted with _id: ${result.insertedId}`);
  } finally {
    await client.close();
  }
}
run().catch(console.dir);
```

## Features it supports
- Document-oriented storage (JSON/BSON)
- Fully flexible schema
- Powerful aggregation framework
- High availability via Replica Sets
- Horizontal scalability via Sharding
- Geospatial indexing and queries

## Real projects about it
- **Uber**: Uses MongoDB to store various types of dynamic data.
- **Lyft**: Uses MongoDB for their ride-matching algorithms.
- **Forbes**: Uses MongoDB for their custom CMS platform.
