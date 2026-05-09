# Prometheus

## Description
Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud. It is now a graduated project of the Cloud Native Computing Foundation (CNCF) and the de facto standard for monitoring in the Kubernetes ecosystem.

## How it works
Prometheus uses a **pull model**: it periodically scrapes metrics from configured HTTP endpoints (e.g., `/metrics`). Metrics are stored in a time-series database with labels for dimensional data. You query this data using PromQL (Prometheus Query Language) and set up alerting rules.

```
┌──────────┐     scrape     ┌──────────────┐
│  Your App │ ◀──────────── │  Prometheus   │
│ /metrics  │               │  Server       │──── PromQL ──── Grafana
└──────────┘               │  (TSDB)       │
                           └──────┬───────┘
                                  │ alerts
                           ┌──────▼───────┐
                           │ Alertmanager  │──── Slack / PagerDuty / Email
                           └──────────────┘
```

## How to code it

### prometheus.yml (Configuration)
```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node-app'
    static_configs:
      - targets: ['app:3000']

  - job_name: 'postgres'
    static_configs:
      - targets: ['postgres-exporter:9187']
```

### Exposing Metrics (Node.js)
```javascript
const client = require('prom-client');
const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics();

const httpRequestDuration = new client.Histogram({
  name: 'http_request_duration_seconds',
  help: 'Duration of HTTP requests in seconds',
  labelNames: ['method', 'route', 'status_code']
});

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', client.register.contentType);
  res.end(await client.register.metrics());
});
```

## Features it supports
- Multi-dimensional time-series data model
- PromQL for flexible querying
- Pull-based metric collection (no agents required)
- Alertmanager for routing alerts
- Service discovery (Kubernetes, Consul, DNS)
- Grafana integration for dashboards
