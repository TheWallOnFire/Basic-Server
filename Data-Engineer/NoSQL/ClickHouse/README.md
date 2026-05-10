# ClickHouse

## Description
ClickHouse is a fast open-source column-oriented database management system that allows generating analytical data reports in real-time using SQL queries.

## When to use
- **Web/Mobile Analytics**: Analyzing billions of user events.
- **Log Management**: Fast search and aggregation of terabytes of logs.
- **Financial Trading**: Analyzing historical market data.
- **AdTech**: Real-time bidding analysis and reporting.

## How to code it
```sql
-- Create table with MergeTree engine
CREATE TABLE events (
  event_time DateTime,
  user_id UInt32,
  event_type String,
  revenue Decimal(18, 4)
) ENGINE = MergeTree()
ORDER BY (event_time, user_id);

-- Analytical query: Sum revenue by day
SELECT
    toDate(event_time) AS day,
    sum(revenue) AS total_revenue
FROM events
GROUP BY day
ORDER BY day DESC;
```

## Features
- **Column-oriented**: Reads only relevant columns for much faster analytics.
- **Massively Parallel Processing (MPP)**: Executes queries across many CPU cores and servers.
- **Data Compression**: Highly efficient storage.
- **SQL Support**: Standard SQL with extensions for analytics.
- Used by Cloudflare, Uber, and eBay.
