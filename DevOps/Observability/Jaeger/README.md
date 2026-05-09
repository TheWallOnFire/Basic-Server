# Jaeger

## Description
Jaeger is an open-source, end-to-end distributed tracing system used for monitoring and troubleshooting transactions in complex distributed systems (microservices).

## Why Jaeger?
- **Distributed Context Propagation**: Tracks a request as it moves through multiple services.
- **Performance Tuning**: Identifies which service is causing latency in a long request chain.
- **Root Cause Analysis**: Visualizes the flow of a single request to see where it failed.

## How to code it (Querying)
Jaeger is typically accessed via its UI. However, your application sends traces using the OpenTelemetry SDK (see the OpenTelemetry README in this folder).

## Features
- **Gantt Chart Visualization**: See exactly how much time each "span" (operation) took.
- **Dependency Graph**: Automatically maps how your services talk to each other.
- **Scalable**: Can handle millions of spans per second.
- **CNCF Graduated**: Industry standard for tracing.
