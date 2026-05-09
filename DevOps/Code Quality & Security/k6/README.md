# k6

## Description
k6 is a modern, developer-centric open-source load testing tool. It is written in Go, but you write your test scripts in JavaScript.

## Why k6?
- **Developer-Friendly**: No clunky UI; write tests as code.
- **Performance**: High-performance engine that can simulate thousands of users on a single machine.
- **Automation**: Designed to be run in CI/CD pipelines.
- **Thresholds**: Define pass/fail criteria (e.g., "95th percentile response time must be < 500ms").

## How to code it
```javascript
import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
  vus: 10,           // 10 virtual users
  duration: '30s',   // for 30 seconds
  thresholds: {
    http_req_duration: ['p(95)<500'], // 95% of requests must be < 500ms
  },
};

export default function () {
  const res = http.get('https://test.k6.io');
  check(res, { 'status was 200': (r) => r.status == 200 });
  sleep(1);
}
```

## Features
- Support for HTTP/1.1, HTTP/2, WebSockets, and gRPC.
- Extensions (xk6) for SQL, Kafka, Redis, etc.
- Native integration with Grafana (visualize results in real-time).
- Cloud service (k6 Cloud) for massive distributed tests.
