# 13. Data Formats & Serialization

Choosing the right data format can dramatically impact storage cost, query speed, and interoperability.

## 1. Column-Oriented vs. Row-Oriented
- **Row-Oriented** (CSV, JSON): Good for writes and full-record reads.
- **Column-Oriented** (Parquet, ORC): Good for analytical queries that scan specific columns.

## 2. Common Formats
| Format | Type | Compression | Schema | Best For |
| :--- | :--- | :--- | :--- | :--- |
| **CSV** | Row / Text | None | ❌ No | Simple exports, small data |
| **JSON** | Row / Text | None | ❌ No | APIs, config, semi-structured |
| **Parquet** | Column / Binary | ✅ Excellent | ✅ Embedded | Analytics, data lakes |
| **Avro** | Row / Binary | ✅ Good | ✅ Embedded | Kafka, streaming, schema evolution |
| **ORC** | Column / Binary | ✅ Excellent | ✅ Embedded | Hive, Spark analytics |
| **Protocol Buffers** | Row / Binary | ✅ Compact | ✅ .proto file | gRPC, internal services |

## 3. Schema Evolution
- **What**: Changing the data schema (adding/removing fields) without breaking consumers.
- **Avro**: Excellent schema evolution — readers and writers can have different schemas.
- **Parquet**: Good — adding columns is easy, removing is harder.
- **Schema Registry**: Confluent Schema Registry for Kafka ensures compatibility.

## 4. Compression
- **Snappy**: Fast compression/decompression, moderate ratio. Used in Spark/Parquet.
- **Gzip**: High compression ratio, slower. Good for archival.
- **Zstandard (zstd)**: Best balance of speed and ratio. Increasingly popular.
- **LZ4**: Fastest decompression. Used in real-time systems.
