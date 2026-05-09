# pgAdmin

## Description
pgAdmin is the most popular and feature-rich open-source administration and development platform for PostgreSQL. It provides a graphical interface to manage databases, run queries, and monitor server performance.

## Key Features
- Visual query editor with syntax highlighting and autocomplete
- Database object browser (tables, views, functions, triggers)
- Graphical query plan viewer (`EXPLAIN ANALYZE` visualization)
- Import/export data (CSV, JSON)
- Server monitoring dashboard (connections, locks, activity)
- Backup and restore utilities

## How to Install
```bash
# Docker (quickest)
docker run -d -p 5050:80 \
  -e PGADMIN_DEFAULT_EMAIL=admin@example.com \
  -e PGADMIN_DEFAULT_PASSWORD=admin \
  dpage/pgadmin4

# Then open http://localhost:5050
```

## When to Use
- Managing PostgreSQL databases visually
- Writing and debugging complex SQL queries
- Monitoring database performance
- Creating backups and managing users/roles
