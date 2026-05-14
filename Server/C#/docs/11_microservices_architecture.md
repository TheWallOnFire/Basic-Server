# 11. Microservices Architecture

Scaling complex applications often requires breaking them into smaller, independent services.

## 1. Core Concepts
- **Independence**: Each service has its own database and release cycle.
- **Communication**: Services talk to each other via APIs (Synchronous) or Message Buses (Asynchronous).
- **Service Discovery**: How services find each other (Consul, Kubernetes DNS).

## 2. Communication Patterns
- **gRPC**: A high-performance, binary RPC framework (Contract-first using Protobuf).
- **REST**: Standard HTTP/JSON communication.
- **Message Queues**: RabbitMQ, Azure Service Bus, or Kafka for "fire and forget" or event-driven logic.

## 3. Containerization (Docker)
.NET is optimized for Docker. A standard Dockerfile for .NET uses multi-stage builds to keep images small.
```dockerfile
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "MyApi.dll"]
```

## 4. API Gateways
A single entry point for all client requests (e.g., Ocelot, YARP - Yet Another Reverse Proxy). Handles routing, authentication, and rate limiting.

## 5. Resiliency Patterns
Using libraries like **Polly** to handle failures gracefully:
- **Retry**: Try again if a request fails.
- **Circuit Breaker**: Stop trying if a service is consistently down.
- **Bulkhead**: Isolate resources to prevent a single service failure from taking down the whole system.
