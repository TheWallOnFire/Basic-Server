# 14. Streaming & Real-Time Data

Streaming enables processing data as it arrives, rather than waiting for batch intervals.

## 1. Core Concepts
- **Event**: A single data record (e.g., a user click, a sensor reading).
- **Producer**: Sends events (your app, IoT device).
- **Consumer**: Reads and processes events.
- **Topic / Stream**: A category or channel for related events.
- **Offset**: A pointer to a specific position in a stream.

## 2. Streaming Platforms
| Platform | Provider | Key Strength |
| :--- | :--- | :--- |
| **Apache Kafka** | Open Source | Industry standard, massive throughput |
| **AWS Kinesis** | AWS | Managed, deep AWS integration |
| **Google Pub/Sub** | GCP | Serverless, auto-scaling |
| **Azure Event Hubs** | Azure | Kafka-compatible, Azure native |
| **Redpanda** | Open Source | Kafka-compatible, no JVM, faster |

## 3. Apache Kafka Deep Dive
- **Brokers**: Servers that store and serve data.
- **Partitions**: Splitting a topic for parallelism.
- **Consumer Groups**: Multiple consumers sharing the workload.
- **Exactly-Once Semantics**: Ensuring each message is processed exactly once.
- **Kafka Connect**: Pre-built connectors for databases, S3, Elasticsearch, etc.

## 4. Change Data Capture (CDC)
- **What**: Capturing row-level changes (INSERT, UPDATE, DELETE) from a database in real-time.
- **Debezium**: The leading open-source CDC platform (works with Kafka).
- **Use Cases**: Syncing databases, building materialized views, event sourcing.

## 5. Stream Processing
- **Apache Flink**: True streaming (event-by-event), state management, exactly-once.
- **Kafka Streams**: Library for building stream processing apps within Kafka.
- **Apache Beam**: Unified batch + stream model (runs on Flink, Spark, Dataflow).
- **Materialized Views**: Pre-computed query results updated in real-time.
