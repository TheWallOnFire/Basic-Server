# Grafana Loki

## Description
Loki is a horizontally scalable, highly available, multi-tenant log aggregation system inspired by Prometheus. It is designed to be very cost-effective and easy to operate.

## Why Loki? (vs ELK)
- **Metadata-only Indexing**: Unlike Elasticsearch, Loki does not index the full text of logs. It only indexes metadata (labels), making it much faster and cheaper to store.
- **Prometheus Integration**: Uses the same label model as Prometheus, allowing you to switch between metrics and logs seamlessly in Grafana.
- **LogQL**: A powerful query language very similar to PromQL.

## How to code it (LogQL)
```logql
# Find logs with error in the "prod" namespace
{namespace="prod"} |= "error"

# Count errors over time
count_over_time({app="my-app"} |= "error" [5m])
```

## Features
- Native Grafana integration.
- Efficient storage on S3/GCS.
- High availability with microservices mode.
- Tail and grep logs in real-time.
