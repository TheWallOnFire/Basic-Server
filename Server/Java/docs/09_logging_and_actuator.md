# 09. Logging & Monitoring

Production visibility is a core feature of the Spring ecosystem.

## 1. Logging (SLF4J & Logback)
Spring Boot uses **SLF4J** as an abstraction and **Logback** as the default implementation.
```java
private static final Logger logger = LoggerFactory.getLogger(MyClass.class);

public void doSomething() {
    logger.info("Processing item {}", itemId); // Use {} for efficient logging
}
```

## 2. Log Levels
Configured in `application.properties`:
```properties
logging.level.root=INFO
logging.level.org.hibernate.SQL=DEBUG
```

## 3. Spring Boot Actuator
Exposes production-ready endpoints to monitor and manage your application.
- `/actuator/health`: Is the app running?
- `/actuator/metrics`: CPU, Memory, HTTP requests.
- `/actuator/info`: Version and build information.
- `/actuator/env`: View environment properties.

## 4. Micrometer
Actuator uses Micrometer to integrate with external monitoring systems like:
- Prometheus
- Grafana
- Datadog
- New Relic

## 5. Distributed Tracing (Sleuth/Zipkin/OpenTelemetry)
Tracing requests as they flow through multiple microservices to identify bottlenecks and failures.
