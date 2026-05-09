# DevOps Fundamentals — Core Concepts

This document covers the high-level philosophy and essential concepts of DevOps.

---

## 1. What is DevOps?
DevOps is not just a role; it's a **culture**, a movement, and a set of practices that combines **Software Development (Dev)** and **IT Operations (Ops)**. The goal is to shorten the systems development life cycle and provide continuous delivery with high software quality.

### The CAMS Framework
- **Culture**: People and process over tools.
- **Automation**: Automate everything that can be automated (CI/CD, IaC).
- **Measurement**: Data-driven decisions (Monitoring, Observability).
- **Sharing**: Collaborative feedback loops.

---

## 2. The DevOps Lifecycle (The Infinity Loop)
DevOps is an iterative process:
1. **Plan**: Task tracking, backlog management.
2. **Code**: Version control (Git).
3. **Build**: Continuous Integration (Docker, Maven, npm).
4. **Test**: Automated testing (Jest, Selenium, SonarQube).
5. **Release**: Artifact management (Harbor, Artifactory).
6. **Deploy**: Continuous Delivery (ArgoCD, Terraform).
7. **Operate**: Infrastructure management (K8s, Ansible).
8. **Monitor**: Observability (Prometheus, Grafana, ELK).

---

## 3. Shift-Left Security (DevSecOps)
The practice of moving security testing to the **earliest stages** of the development process. Instead of waiting until a release is ready, we scan for vulnerabilities during the coding and building phases using tools like **Trivy** and **Snyk**.

---

## 4. Site Reliability Engineering (SRE)
SRE is what happens when you ask a software engineer to design an operations function.
- **SLI (Service Level Indicator)**: A specific metric (e.g., Error Rate).
- **SLO (Service Level Objective)**: The target for that metric (e.g., < 0.1% error rate).
- **Error Budget**: The amount of downtime or error rate allowed (100% - SLO).

---

## 5. Infrastructure as Code (IaC) vs. Configuration Management
- **IaC (Terraform, Pulumi)**: Provisions the "hardware" or cloud resources (Virtual Machines, Databases, Networks).
- **Config Management (Ansible, Chef)**: Configures the "software" inside those resources (installing Node.js, setting up Nginx).

---

## 6. Containers vs. Virtual Machines

| Feature | Containers (Docker) | Virtual Machines |
| :--- | :--- | :--- |
| **Isolation** | Process-level (Namespace/Cgroups) | Hardware-level (Hypervisor) |
| **Size** | Megabytes (Shared Kernel) | Gigabytes (Full OS) |
| **Startup** | Seconds | Minutes |
| **Efficiency** | Very High | Medium |

---

## 7. Key Terms Glossary
- **GitOps**: Using Git as the single source of truth for infrastructure and application state.
- **Service Mesh**: A dedicated infrastructure layer for handling service-to-service communication.
- **Observability**: The ability to measure the internal state of a system by looking at its outputs (Logs, Metrics, Traces).
- **Immutable Infrastructure**: Instead of updating a server, you replace it with a new one from a new image.
