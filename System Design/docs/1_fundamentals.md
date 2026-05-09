# System Design Fundamentals

## 1. CAP Theorem
In a distributed data store, you can only provide two of the following three guarantees:
- **Consistency**: Every read receives the most recent write or an error.
- **Availability**: Every request receives a (non-error) response, without the guarantee that it contains the most recent write.
- **Partition Tolerance**: The system continues to operate despite an arbitrary number of messages being dropped or delayed by the network between nodes.

**Real-world pick**: You always need Partition Tolerance in a network. So you choose between **CP** (HBase, MongoDB) or **AP** (Cassandra, CouchDB).

## 2. PACELC Theorem
An extension of CAP. It says: if there is a partition (P), how does the system tradeoff between availability (A) and consistency (C)? Else (E), when the system is running normally in the absence of partitions, how does the system tradeoff between latency (L) and consistency (C)?

## 3. ACID vs. BASE
- **ACID**: Atomicity, Consistency, Isolation, Durability (Relational DBs). Focuses on strict consistency.
- **BASE**: Basically Available, Soft state, Eventual consistency (NoSQL DBs). Focuses on high availability.

## 4. Strong vs. Eventual Consistency
- **Strong**: After an update, every subsequent access will see the update (Slow, complex).
- **Eventual**: If no new updates are made to the object, eventually all accesses will return the last updated value (Fast, simple).
