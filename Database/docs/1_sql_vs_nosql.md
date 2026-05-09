# SQL vs. NoSQL: The Deep Dive

## When to use SQL (Relational)
- **Data Integrity**: You need strict schema validation and ACID transactions (e.g., Banking).
- **Complex Relationships**: You have data that is highly relational and requires multiple JOINS.
- **Stable Schema**: Your data structure doesn't change frequently.

## When to use NoSQL (Non-Relational)
- **High Velocity**: You need to write massive amounts of data per second (e.g., IoT metrics).
- **Unstructured Data**: You don't know the schema yet or it changes often (e.g., User profiles, Catalogs).
- **Scalability**: You need to scale horizontally across many servers easily.

---

## Comparison Table

| Feature | SQL | NoSQL |
| :--- | :--- | :--- |
| **Model** | Tables / Rows | Documents / Key-Value / Graphs |
| **Schema** | Predefined (Rigid) | Dynamic (Flexible) |
| **Scaling** | Vertical (Mostly) | Horizontal (Native) |
| **Transactions** | ACID (Strict) | BASE (Eventual) |
| **Joins** | Core feature | ⚠️ Usually done in code |
