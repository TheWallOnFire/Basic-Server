# 10. Data Pipelines

Data pipelines are the systems that move, transform, and deliver data from source to destination.

## 1. ETL vs. ELT
| Pattern | Process | Best For |
| :--- | :--- | :--- |
| **ETL** (Extract, Transform, Load) | Transform *before* loading | Traditional data warehouses |
| **ELT** (Extract, Load, Transform) | Transform *after* loading | Modern cloud warehouses (BigQuery, Snowflake) |

## 2. Batch vs. Streaming
- **Batch Processing**: Process large volumes at scheduled intervals (hourly/daily).
  - Tools: **Apache Spark**, **Hadoop MapReduce**, **dbt**.
- **Stream Processing**: Process data in real-time as it arrives.
  - Tools: **Apache Flink**, **Kafka Streams**, **Apache Beam**.

## 3. Apache Spark
The industry standard for large-scale data processing.
- **Spark SQL**: SQL queries on big data.
- **PySpark**: Python API for Spark.
- **DataFrames**: Distributed data structures similar to Pandas.
- **Spark Streaming**: Micro-batch stream processing.

## 4. Modern Data Stack
```
Source → Ingestion (Fivetran/Airbyte) → Warehouse (Snowflake/BigQuery) → Transform (dbt) → BI (Metabase/Looker)
```
- **Fivetran / Airbyte**: Managed data ingestion from 300+ sources.
- **dbt (data build tool)**: SQL-first transformation — "Git for your data warehouse."
- **Great Expectations**: Data validation and quality testing.
