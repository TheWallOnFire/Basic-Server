# System Design Fundamentals

This pillar covers the high-level principles, patterns, and components required to build scalable, reliable, and performant distributed systems. It follows the [roadmap.sh/system-design](https://roadmap.sh/system-design) path.

---

## 🗺️ Learning Path

### 1. [Scalability](./Scalability/)
- **Vertical vs Horizontal Scaling**.
- **Performance vs Scalability**.
- **Latency vs Throughput**.

### 2. [Reliability & Availability](./Reliability/)
- **SLAs, SLOs, and SLIs**.
- **High Availability (HA)** and Redundancy.
- **Failover & Replication**.

### 3. [Protocols](./Protocols/)
- **HTTP/HTTPS** (REST, gRPC, GraphQL).
- **WebSockets** (Real-time).
- **WebRTC** (Peer-to-Peer).
- **MQTT** (IoT/Messaging).

### 4. [Caching](./Caching/)
- **Client-side** vs **Server-side**.
- **CDN (Content Delivery Network)**.
- **Cache Eviction Policies** (LRU, LFU).

### 5. [Load Balancing](./Load%20Balancing/)
- **Layer 4 vs Layer 7** Load Balancing.
- **Algorithms**: Round Robin, Least Connections, IP Hash.

### 6. [Proxies](./Proxies/)
- **Forward Proxy** vs **Reverse Proxy**.
- **API Gateways**.

### 7. [Microservices](./Microservices/)
- **Service Discovery**.
- **Service Mesh**.
- **Database per Service**.

### 8. [Messaging](./Messaging/)
- **Message Queues** (RabbitMQ).
- **Pub/Sub** (Kafka).
- **Event-Driven Architecture**.

### 9. [Design Patterns](./Design%20Patterns/)
- **Monolithic vs Microservices**.
- **CQRS** (Command Query Responsibility Segregation).
- **Event Sourcing**.

---

## 📜 Master Guides & Documentation
- **[System Design Fundamentals (CAP/ACID)](./docs/1_fundamentals.md)**
- **[Interview Cheat Sheet (Estimates & Frameworks)](./docs/2_interview_cheatsheet.md)**
- **[Real-world Case Studies (URL Shortener, Feed)](./docs/3_case_studies.md)**

---

## 🛠️ Tools of the Trade
- **Monitoring**: Prometheus, Grafana.
- **Logging**: ELK Stack, Loki.
- **Tracing**: Jaeger, OpenTelemetry.
- **Infrastructure**: Terraform, Kubernetes.
