# Grafana

## Description
Grafana is an open-source platform for monitoring and observability visualization. It connects to data sources like Prometheus, Elasticsearch, InfluxDB, and PostgreSQL to create beautiful, interactive dashboards.

## How it works
Grafana does not collect or store data itself. Instead, it connects to your existing data sources, lets you write queries (PromQL, SQL, Lucene, etc.), and visualizes the results in customizable panels (graphs, gauges, tables, heatmaps, etc.).

## How to set up
```bash
# Docker (quickest)
docker run -d -p 3001:3000 --name grafana grafana/grafana-oss

# Then open http://localhost:3001
# Default login: admin / admin
```

### Docker Compose (with Prometheus)
```yaml
services:
  prometheus:
    image: prom/prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
    ports:
      - "9090:9090"

  grafana:
    image: grafana/grafana-oss
    ports:
      - "3001:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
    volumes:
      - grafana_data:/var/lib/grafana

volumes:
  grafana_data:
```

## Features it supports
- 100+ data source plugins (Prometheus, Elasticsearch, MySQL, PostgreSQL, CloudWatch, etc.)
- Rich visualization types (time-series, bar charts, pie charts, heatmaps, geomap)
- Dashboard templating with variables
- Alerting with notification channels (Slack, Email, PagerDuty, Teams)
- Dashboard sharing and embedding
- Annotations to mark events on graphs
- Provisioning dashboards and data sources via YAML (GitOps)

## Real projects about it
- **Wikipedia**: Uses Grafana to monitor their global infrastructure.
- **PayPal**: Monitors payment processing with Grafana dashboards.
- **CERN**: Visualizes particle physics data from the Large Hadron Collider.
