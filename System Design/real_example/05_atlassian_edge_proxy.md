# Designing Atlassian's Centralized Edge / Ingress Proxy

Based on the engineering practices presented in [The Atlassian Edge Architecture](https://www.youtube.com/watch?v=55pTFVoclvE), this document breaks down how Atlassian replaced expensive enterprise load balancers with a highly programmable, centralized ingress platform using Envoy.

---

## 1. Core Architectural Challenge

### The Problem
Historically, Atlassian used expensive, proprietary enterprise load balancers. Internal development teams had to navigate complex, non-standard configurations to set up public ingress routing for their individual microservices.

### The Solution
Build a centralized, programmable, multi-tenant ingress platform using commodity open-source technologies—specifically, **Envoy Proxy**. 

### The Outcome
Internal developers could independently provision ingress resources using self-service APIs and Configuration-as-Code. All major products (Jira, Confluence, Bitbucket, Statuspage) and thousands of internal microservices were moved behind this unified, secure edge layer. Services were completely blocked from public exposure unless routed through this ingress fleet.

---

## 2. Key Architectural Components

### A. Open Service Broker (OSP)
The self-service API entry point for internal developers to request dynamic infrastructure (DNS, CloudFront, edge routing).

- **Tech Stack**: Python (**FastAPI**).
- **Asynchronous Workflow**: 
  1. Developers commit configuration files (JSON) to their repo.
  2. The CI/CD pipeline pushes this config to the FastAPI service broker.
  3. The broker drops the task into **AWS SQS**.
  4. A background worker picks up the task, provisions the required AWS resources, and records the dynamic state in **Amazon DynamoDB**.

### B. Envoy Proxy Ingress Fleet
A massive routing fleet consisting of ~2,000 proxies spanning ~13 AWS regions.

- **Infrastructure as Code**: Fully provisioned via **AWS CloudFormation** (VPCs, NLBs, Auto Scaling Groups, Route 53).
- **Golden AMIs**: Built using **HashiCorp Packer** and **SaltStack** to ensure security hardening, logging configuration, and installation of local sidecars.
- **Dynamic Updates**: Uses Envoy's **xDS APIs** to dynamically reload cluster definitions, routes, and listeners at runtime without dropping any traffic or requiring restarts.

### C. Envoy Control Plane ("Sovereign")
A custom-built management server that serves the dynamic configuration directly to the Envoy proxies.

- **Engine**: A **FastAPI** application that polls routing context from **DynamoDB** and dynamic state files from **Amazon S3**.
- **Template Rendering**: It renders these states into Envoy-compliant configurations using Jinja templates.
- **Validation**: Contains strict validation logic to ensure that bad user configurations (e.g., malformed JSON from an internal team) can *never* break the active proxy fleet.

### D. Extensible Sidecars
To resolve cross-cutting concerns (Auth, Rate Limiting, Logging) once at the edge, instead of forcing thousands of microservice teams to rebuild them.

- **Authentication**: A custom sidecar written in **Rust** to quickly verify user identity.
- **Authorization & Rate Limiting**: Dedicated sidecars built by specialized platform teams, running locally next to the Envoy proxy.
- **Logging**: Standardized natively inside Envoy using the HTTP Connection Manager (HCM).

---

## 3. High-Level System Flow

1. **Declaration**: A developer commits a simple JSON config defining their public routes.
2. **Provisioning**: The CI pipeline sends this to the FastAPI Service Broker. The worker provisions resources and saves the state to DynamoDB.
3. **Control Plane Rendering**: The "Sovereign" control plane reads DynamoDB/S3, validates the input, renders the Envoy configurations, and pushes them to the proxy fleet via xDS.
4. **Traffic Flow**: 
   - A customer request hits the **Network Load Balancer (NLB)**.
   - It is routed to the **Envoy Proxy**.
   - Envoy delegates verification to local sidecars (e.g., the Rust Auth sidecar).
   - Only authenticated and rate-limited requests are finally forwarded to the **Backend Microservice**.
