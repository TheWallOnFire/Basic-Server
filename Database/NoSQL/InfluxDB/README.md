# InfluxDB

## Description
InfluxDB is an open-source time-series database (TSDB) optimized for fast, high-availability storage and retrieval of time-stamped data.

## When to use
- **IoT Monitoring**: Storing sensor readings every second.
- **DevOps Metrics**: Server CPU, memory, and network usage over time.
- **Financial Data**: Stock prices or crypto trade history.
- **Real-time Analytics**: Tracking user events in an app.

## How to code it (Flux Query)
```flux
from(bucket: "my-bucket")
  |> range(start: -1h)
  |> filter(fn: (r) => r._measurement == "cpu")
  |> filter(fn: (r) => r._field == "usage_user")
  |> filter(fn: (r) => r.cpu == "cpu-total")
  |> aggregateWindow(every: 1m, fn: mean, createEmpty: false)
  |> yield(name: "mean")
```

## Features
- Purpose-built for time-series (very fast writes).
- Retention policies to automatically delete old data.
- Built-in UI for data exploration and dashboards.
- Flux query language (powerful and functional).
- Integration with Grafana and Telegraf (the TIG stack).
