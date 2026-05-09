# OpenTelemetry (OTel)

## Description
OpenTelemetry is a vendor-neutral observability framework for generating, collecting, and exporting telemetry data (traces, metrics, and logs). it is the CNCF standard for observability.

## How it works
OpenTelemetry provides a set of APIs, SDKs, and tools to instrument your applications. Instead of using different libraries for Datadog, New Relic, and Jaeger, you use OpenTelemetry once and "export" the data to any of those backends.

## How to code it (Node.js)
```javascript
const { NodeSDK } = require('@opentelemetry/sdk-node');
const { OTLPTraceExporter } = require('@opentelemetry/exporter-trace-otlp-http');

const sdk = new NodeSDK({
  traceExporter: new OTLPTraceExporter({
    url: 'http://localhost:4318/v1/traces',
  }),
  instrumentations: [/* Express, HTTP, etc */],
});

sdk.start();
```

## Features
- **Unified**: One standard for Traces, Metrics, and Logs.
- **Portable**: Switch backends (e.g., Jaeger to Honeycomb) without changing code.
- **Auto-Instrumentation**: Libraries that automatically track HTTP requests, DB queries, etc.
- **Collector**: A standalone service that receives, processes, and exports data.
