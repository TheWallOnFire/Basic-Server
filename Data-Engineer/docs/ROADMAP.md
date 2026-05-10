# 🗺️ Data Engineer Roadmap

Welcome to the Data Engineer Roadmap! This guide combines database fundamentals with the [roadmap.sh/data-engineer](https://roadmap.sh/data-engineer) path to take you from understanding storage engines to building production data pipelines.

---

## 🏁 How to use this roadmap
Follow the steps below in order. The first half covers database foundations; the second half covers data engineering at scale.

---

## 🛤️ The Path

### 🟢 Phase 1: Database Foundations
Start here to understand what a database is and how to design one correctly from day one.
1. **[Database Design Basics](./01_design_basics.md)**: Entities, Primary Keys, Foreign Keys, and Normalization.
2. **[SQL vs. NoSQL](./02_sql_vs_nosql.md)**: Understanding the two major paradigms and when to choose which.

### 🟡 Phase 2: Core Database Concepts
Once you know the basics, learn how to make your database fast and reliable.
3. **[Indexing Strategies](./03_indexing_strategies.md)**: Learn how to make your queries lightning fast.
4. **[CAP Theorem & Consistency](./04_cap_theorem.md)**: Understanding the trade-offs in distributed systems.

### 🟠 Phase 3: Scaling & Reliability
For when your application grows beyond a single server.
5. **[Sharding & Replication](./05_sharding_replication.md)**: How to scale your data across many machines.
6. **[Common Database Problems](./06_common_problems.md)**: Troubleshooting slow queries, deadlocks, and connection limits.

### 🔴 Phase 4: Advanced Design
Modern patterns for professional development.
7. **[Database Design Patterns](./07_design_patterns.md)**: Outbox pattern, CQRS, and more.
8. **[Tools & Comparisons](./08_tools_and_comparisons.md)**: A deep dive into engines (Postgres, Mongo, Redis) and ORMs (Prisma, Drizzle).

### 📚 Phase 5: Resources
9. **[Learning Resources](./09_learning_resources.md)**: Books, courses, and interactive tutorials.

### 🟣 Phase 6: Data Engineering at Scale
Build production-grade data systems that power analytics and ML.
10. **[Data Pipelines](./10_data_pipelines.md)**: ETL vs ELT, batch vs streaming, Apache Spark, and the Modern Data Stack.
11. **[Data Warehousing](./11_data_warehousing.md)**: Star schema, OLAP vs OLTP, BigQuery/Snowflake/Redshift, and Data Lakehouses.
12. **[Data Orchestration](./12_data_orchestration.md)**: Apache Airflow, Prefect, Dagster, and workflow scheduling.
13. **[Data Formats & Serialization](./13_data_formats.md)**: Parquet, Avro, ORC, Protocol Buffers, and schema evolution.
14. **[Streaming & Real-Time Data](./14_streaming.md)**: Kafka, Flink, CDC with Debezium, and stream processing.

---

## 🚀 Pro Tip
Don't just read! Start with **PostgreSQL** for database fundamentals, then try building an ETL pipeline with **dbt** + **BigQuery** or **Apache Airflow** to see data engineering in action.
