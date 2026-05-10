# 05. Performance Testing

Performance testing ensures your application can handle expected (and unexpected) user load.

## 1. Types of Performance Testing
- **Load Testing**: Can the system handle the expected number of users?
- **Stress Testing**: What happens when you exceed the limit?
- **Spike Testing**: How does it react to a sudden burst of traffic?
- **Soak Testing**: Does performance degrade over long periods?
- **Scalability Testing**: How well does it handle increasing load?

## 2. Key Metrics
- **Response Time**: How long a request takes (p50, p95, p99).
- **Throughput**: Requests per second (RPS).
- **Error Rate**: Percentage of failed requests.
- **Concurrent Users**: How many users can use the system simultaneously.
- **Resource Utilization**: CPU, Memory, Disk I/O, Network.

## 3. Tools
| Tool | Language | Key Strength |
| :--- | :--- | :--- |
| **k6** | JavaScript | Developer-friendly, CI/CD native |
| **JMeter** | Java/GUI | Enterprise standard, rich plugins |
| **Locust** | Python | Python scripting, distributed |
| **Gatling** | Scala | High-performance, detailed reports |
| **Artillery** | JavaScript | YAML config, cloud-ready |

## 4. Best Practices
- Test in a **production-like environment**.
- Establish **baselines** before making changes.
- Automate performance tests in **CI/CD pipelines**.
- Monitor backend resources **during** tests (CPU, RAM, DB connections).
