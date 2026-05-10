# ⚡ API Testing with k6

A high-performance API testing and monitoring suite using Grafana k6.

## 🏗️ Architecture
- **Functional Testing**: Verify status codes, JSON schemas, and response times.
- **Load Generation**: Scale from 1 to thousands of virtual users (VUs).
- **Environment Driven**: Use different configurations for Dev, Staging, and Prod.

## 🛠️ Stack
- **Engine**: k6 (Go-based, JS scripting)
- **Language**: JavaScript (ES6)

## 🚀 Getting Started
1. Install k6 (via Homebrew, Chocolatey, or Docker).
2. Run functional tests:
   ```bash
   k6 run script.js
   ```

## 🧪 Key Features
- **Low Footprint**: Extremely efficient resource usage.
- **Metrics**: Built-in support for Prometheus and Grafana.
- **Checks & Thresholds**: Define "pass/fail" criteria (e.g., "95th percentile < 200ms").
