# 🗺️ Data Engineer Roadmap

Welcome to the Data Engineer Roadmap! This guide is based on the [roadmap.sh/data-engineer](https://roadmap.sh/data-engineer) and is designed to take you from understanding database internals to building massive data pipelines.

---

## 🛤️ The Path

### 🟢 Phase 1: Database Internals
1. **[Design Basics](./01_design_basics.md)**: Normalization, Relationships, and Primary/Foreign Keys.
2. **[CRUD Operations](./16_crud_operations.md)**: The four basic pillars of data manipulation.
3. **[Programmability (Triggers/Procedures)](./18_database_features_programmability.md)**: Automating logic inside the database.
4. **[ACID, BASE & PACELC](./15_database_rules_acid_base.md)**: The fundamental rules of data consistency and availability.
5. **[SQL vs NoSQL](./02_sql_vs_nosql.md)**: Choosing the right engine for the right job.
6. **[Indexing Strategies](./03_indexing_strategies.md)**: B-Trees, Hash indexes, and query optimization.
7. **[CAP Theorem](./04_cap_theorem.md)**: Consistency, Availability, and Partition Tolerance in distributed systems.

### 🟡 Phase 2: Scaling & Reliability
6. **[Sharding & Replication](./05_sharding_replication.md)**: Horizontal scaling and high availability.
7. **[Common Problems](./06_common_problems.md)**: N+1 queries, deadlocks, and slow joins.
8. **[Design Patterns](./07_design_patterns.md)**: Standard patterns for scalability.
9. **[Distributed Patterns (CQRS + Kafka)](./17_distributed_patterns_kafka_cqrs.md)**: Building event-driven architectures with the Outbox pattern.

### 🟠 Phase 3: Data Engineering & Pipelines
9. **[Data Formats](./13_data_formats.md)**: JSON, Parquet, Avro, and Protobuf.
10. **[Data Pipelines (ETL/ELT)](./10_data_pipelines.md)**: Moving data from source to warehouse.
11. **[Data Orchestration](./12_data_orchestration.md)**: Airflow, Prefect, and Dagster.
12. **[Streaming](./14_streaming.md)**: Real-time processing with Kafka and Flink.

### 🔴 Phase 4: Modern Data Stack
13. **[Data Warehousing](./11_data_warehousing.md)**: OLAP engines like BigQuery and Snowflake.
14. **[Tools & Comparisons](./08_tools_and_comparisons.md)**: Postgres vs Mongo vs Redis vs ClickHouse.
15. **[Learning Resources](./09_learning_resources.md)**: Books, courses, and certifications.

---

## 🚀 Pro Tip
A Senior Data Engineer doesn't just know "SQL". They know **how a database behaves under load**. Mastering **ACID vs BASE** is the first step toward understanding distributed systems.
