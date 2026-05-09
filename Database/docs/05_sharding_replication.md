# Sharding & Replication

## 1. Replication (High Availability)
Copying data across multiple servers (Replicas).
- **Master-Slave**: One node handles writes, others handle reads. If master dies, a slave is promoted.
- **Multi-Master**: All nodes handle both reads and writes. High complexity due to conflict resolution.

## 2. Sharding (Horizontal Scaling)
Splitting a single dataset into multiple smaller parts (Shards) and distributing them across multiple servers.
- **Horizontal Partitioning**: Splitting by rows (e.g., Users A-M in Shard 1, N-Z in Shard 2).
- **Vertical Partitioning**: Splitting by columns (e.g., User personal info in DB 1, User billing info in DB 2).

## 3. Sharding Strategies
- **Range Based**: Shard based on a range (e.g., Dates, Alphabet).
- **Hash Based**: Shard based on the result of a hash function on the ID.
- **Directory Based**: A lookup service tells you which shard has which data.
