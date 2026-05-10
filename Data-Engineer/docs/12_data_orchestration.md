# 12. Data Orchestration

Orchestration tools schedule, monitor, and manage the dependencies between data pipeline tasks.

## 1. Why Orchestration?
- Data pipelines have **dependencies** (Task B needs Task A's output).
- Pipelines need to run on **schedules** (daily, hourly, event-driven).
- Failures need **alerting, retries, and backfills**.

## 2. Tools
| Tool | Language | Key Strength |
| :--- | :--- | :--- |
| **Apache Airflow** | Python | Industry standard, massive ecosystem |
| **Prefect** | Python | Modern, Pythonic, easy error handling |
| **Dagster** | Python | Asset-oriented, great for dbt integration |
| **Mage AI** | Python | Modern, notebook-style pipelines |
| **Luigi** | Python | Spotify's lightweight orchestrator |

## 3. Apache Airflow Deep Dive
- **DAGs (Directed Acyclic Graphs)**: Define task dependencies.
- **Operators**: Pre-built tasks (BashOperator, PythonOperator, PostgresOperator).
- **Sensors**: Wait for external conditions (file exists, API available).
- **XComs**: Pass small data between tasks.
- **Connections & Hooks**: Manage external system credentials.

## 4. Key Concepts
- **Idempotency**: Running a pipeline twice produces the same result.
- **Backfilling**: Re-running historical pipeline runs.
- **SLAs**: Setting deadlines for task completion.
- **Observability**: Monitoring DAG runs, task durations, and failure rates.
