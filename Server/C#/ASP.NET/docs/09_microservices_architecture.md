# 09. Microservices Architecture

Moving from a Monolith to a distributed, scalable system.

---

## 1. Core Principles
- **Independent Deployment**: You can update one service without touching the others.
- **Own Database**: Each service owns its data to prevent tight coupling.
- **Polyglot**: You can use different languages or databases for different services (though most stick to .NET).

---

## 2. Service Communication
- **Synchronous (gRPC)**: Extremely fast, binary communication. Best for internal "Service-to-Service" calls.
- **Asynchronous (Messaging)**: Using **RabbitMQ**, **Azure Service Bus**, or **Kafka**. Best for "Fire and Forget" operations like sending an email or processing an order.

---

## 3. Resilience (Polly)
In a distributed system, network failures are guaranteed. **Polly** provides policies to handle them:
- **Retry**: Try the request again after a few seconds.
- **Circuit Breaker**: Stop trying if a service is consistently failing to prevent "cascading failures."

---

## 4. API Gateways
Instead of clients talking to 20 different services, they talk to **one** gateway (like **YARP**). The gateway handles:
- Routing.
- Authentication.
- Rate Limiting.
- SSL Termination.

---

## 5. Deployment (Docker & Kubernetes)
- **Docker**: Package your app and its dependencies into a single "Container."
- **Kubernetes (K8s)**: Orchestrate thousands of containers, handling scaling, load balancing, and self-healing.

---

## 🚀 Pro Tip
Don't start with Microservices. Start with a **Modular Monolith**. It's much easier to develop and you can split it into microservices later when you actually need the scale.
