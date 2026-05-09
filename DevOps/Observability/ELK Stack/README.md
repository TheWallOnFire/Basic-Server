# ELK Stack (Elasticsearch + Logstash + Kibana)

## Description
The ELK Stack is the world's most popular open-source log management platform. It consists of three components working together to collect, process, store, and visualize log data:
- **Elasticsearch**: Stores and indexes log data for fast search.
- **Logstash**: Ingests, transforms, and ships log data from various sources.
- **Kibana**: Visualizes log data with dashboards, charts, and search interfaces.

## How it works
```
┌────────────┐     ┌────────────┐     ┌────────────────┐     ┌──────────┐
│  Your Apps  │ ──▶ │  Logstash   │ ──▶ │ Elasticsearch   │ ◀── │  Kibana   │
│  (logs)     │     │ (transform) │     │ (store/search)  │     │ (view)    │
└────────────┘     └────────────┘     └────────────────┘     └──────────┘
```

## Docker Compose Setup
```yaml
services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.12.0
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false
    ports:
      - "9200:9200"
    volumes:
      - es_data:/usr/share/elasticsearch/data

  logstash:
    image: docker.elastic.co/logstash/logstash:8.12.0
    volumes:
      - ./logstash.conf:/usr/share/logstash/pipeline/logstash.conf
    depends_on:
      - elasticsearch

  kibana:
    image: docker.elastic.co/kibana/kibana:8.12.0
    ports:
      - "5601:5601"
    depends_on:
      - elasticsearch

volumes:
  es_data:
```

## Features it supports
- Centralized logging from all services
- Full-text search across billions of log entries
- Real-time log tailing and filtering
- Dashboard creation in Kibana
- Alerting on log patterns (errors, anomalies)
- APM (Application Performance Monitoring)
