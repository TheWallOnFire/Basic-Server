# The CAP Theorem

The CAP Theorem (also known as Brewer's theorem) is a fundamental concept in distributed database systems. It states that it is impossible for a distributed data store to simultaneously provide more than two out of the following three guarantees:

## 1. Consistency (C)
Every read receives the most recent write or an error. 
If a system is Consistent, any user querying the database at any node will see the exact same data simultaneously.

## 2. Availability (A)
Every request receives a (non-error) response, without the guarantee that it contains the most recent write. 
If a system is Available, it will always process your query, even if some nodes in the network are down.

## 3. Partition Tolerance (P)
The system continues to operate despite an arbitrary number of messages being dropped (or delayed) by the network between nodes.
Since network partitions (failures) are a reality of distributed systems, a distributed database *must* be Partition Tolerant. Therefore, the real choice is always between **Consistency** and **Availability** during a partition.

---

## The Trade-offs

### CP Databases (Consistency and Partition Tolerance)
If a network partition occurs, the system will shut down the out-of-sync node (making it unavailable) to ensure no conflicting data is read or written.
- **Examples**: MongoDB (default), Redis, HBase.
- **Use Case**: Financial transactions where reading stale data is unacceptable.

### AP Databases (Availability and Partition Tolerance)
If a network partition occurs, the system will keep all nodes available to accept reads and writes, even if the nodes are out of sync. Once the network partition is resolved, the nodes will sync back up (Eventual Consistency).
- **Examples**: Cassandra, CouchDB, DynamoDB.
- **Use Case**: Social media feeds or shopping carts where it's better to show slightly outdated data than an error page.

### What about CA?
A system that guarantees Consistency and Availability but *not* Partition Tolerance cannot exist in a distributed network. A traditional, single-node RDBMS (like a standalone MySQL or PostgreSQL server) is considered CA because it doesn't have to deal with network partitions. However, once you cluster them over a network, you must choose between C or A.
