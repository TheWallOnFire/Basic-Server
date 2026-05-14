# 11. Microservices Architecture

Scaling Java applications with the Cloud Native ecosystem.

## 1. Spring Cloud
A suite of tools for common patterns in distributed systems:
- **Config Server**: Centralized configuration management.
- **Eureka / Consul**: Service discovery.
- **Spring Cloud Gateway**: API routing and security.
- **OpenFeign**: Declarative REST client for inter-service communication.

## 2. Resilience with Resilience4j
Implementing patterns to handle network failures:
- **Retry**, **Circuit Breaker**, **Rate Limiter**, **Bulkhead**.

## 3. Containerization (Docker)
Modern Spring Boot includes **Buildpacks**, allowing you to create Docker images without a Dockerfile:
`./gradlew bootBuildImage` or `./mvnw spring-boot:build-image`

## 4. Kubernetes Integration
Spring Boot is Kubernetes-aware:
- **ConfigMaps**: Loaded as properties.
- **Liveness/Readiness Probes**: Integrated with Actuator health checks.

## 5. Event-Driven Architecture
- **Spring Cloud Stream**: Unified way to talk to RabbitMQ, Kafka, or AWS Kinesis.
- **CloudEvents**: Standard format for event data.
