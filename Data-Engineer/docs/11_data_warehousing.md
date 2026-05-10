# 11. Data Warehousing

A data warehouse is a centralized repository optimized for analytical queries rather than transactional operations.

## 1. OLTP vs. OLAP
| Feature | OLTP | OLAP |
| :--- | :--- | :--- |
| **Purpose** | Day-to-day operations | Analytics & Reporting |
| **Queries** | Short, simple (CRUD) | Complex, aggregations |
| **Schema** | Normalized (3NF) | Denormalized (Star/Snowflake) |
| **Examples** | PostgreSQL, MySQL | BigQuery, Redshift |

## 2. Schema Design
- **Star Schema**: Fact table at center, dimension tables around it. Simple, fast queries.
- **Snowflake Schema**: Normalized dimensions. Saves storage, more complex queries.
- **Data Vault**: Hub-Link-Satellite model for enterprise-scale historized data.

## 3. Cloud Data Warehouses
| Platform | Provider | Key Strength |
| :--- | :--- | :--- |
| **BigQuery** | Google | Serverless, pay-per-query |
| **Snowflake** | Independent | Multi-cloud, data sharing |
| **Redshift** | AWS | Deep AWS integration |
| **Databricks** | Independent | Unified analytics + ML (Lakehouse) |
| **Synapse** | Azure | Azure ecosystem integration |

## 4. Data Lakes vs. Data Warehouses
- **Data Lake**: Raw, unprocessed data in any format (S3, GCS, ADLS).
- **Data Warehouse**: Cleaned, structured data ready for analysis.
- **Data Lakehouse**: Best of both — raw storage with warehouse-like query performance (Delta Lake, Apache Iceberg).

## 5. Data Modeling
- **Kimball**: Bottom-up, business-process oriented (Star Schema).
- **Inmon**: Top-down, enterprise-wide normalized model.
- **dbt Models**: SQL-based transformations versioned in Git.
