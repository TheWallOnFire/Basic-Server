# Cassandra

## Description
Apache Cassandra is a free and open-source, distributed, wide-column store, NoSQL database management system designed to handle large amounts of data across many commodity servers, providing high availability with no single point of failure.

## How it works
Cassandra uses a peer-to-peer architecture based on a Dynamo-style replication model. Data is partitioned and replicated across multiple nodes in a cluster. When writing data, Cassandra uses a commit log and memtables to ensure fast, sequential writes. It achieves massive scalability because any node can handle read or write requests.

## How to code it
Here is a basic example of querying Cassandra using Node.js and the `cassandra-driver`:

```javascript
const cassandra = require('cassandra-driver');

const client = new cassandra.Client({ 
  contactPoints: ['127.0.0.1'], 
  localDataCenter: 'datacenter1', 
  keyspace: 'my_keyspace' 
});

async function run() {
  const query = 'SELECT name, age FROM users WHERE id = ?';
  const result = await client.execute(query, [1], { prepare: true });
  console.log('User name:', result.first().name);
  await client.shutdown();
}

run();
```

## Features it supports
- Massive scalability (linear scale performance)
- No single point of failure (peer-to-peer architecture)
- Tunable consistency (choose between strong or eventual consistency)
- Cassandra Query Language (CQL), similar to SQL
- High write throughput

## Real projects about it
- **Netflix**: Uses Cassandra to store massive amounts of viewing history data.
- **Discord**: Migrated billions of messages to Cassandra for scalability.
- **Apple**: One of the largest deployments of Cassandra in the world (over 100,000 nodes).
