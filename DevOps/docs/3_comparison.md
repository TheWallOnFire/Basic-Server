# DevOps Roadmap — Comprehensive Comparison

This document provides a detailed comparison of tools across the entire DevOps lifecycle, based on the [roadmap.sh/devops](https://roadmap.sh/devops) path.

---

# 1. CI/CD Platforms

| Feature | Jenkins | GitHub Actions | GitLab CI | CircleCI | ArgoCD | FluxCD |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Type** | Self-hosted server | Cloud service | Cloud / Self-hosted | Cloud service | GitOps CD (Pull) | GitOps CD (Pull) |
| **Config File** | `Jenkinsfile` | `.github/workflows/*.yml` | `.gitlab-ci.yml` | `.circleci/config.yml` | `Application` CRD | `Kustomization` CRD |
| **UI** | ✅ Comprehensive | ✅ Simple | ✅ Good | ✅ Good | ✅ Excellent | ⚠️ Minimal (optional) |
| **Auto-Image Update**| ❌ Manual | ❌ Manual | ❌ Manual | ❌ Manual | ⚠️ Via Image Updater | ✅ Native Feature |
| **Learning Curve** | Medium-High | Low | Low-Medium | Low | Medium | Medium-High |
| **Best For** | Complex pipelines | GitHub projects | GitLab projects | Fast Docker CI | K8s GitOps (Visual) | K8s GitOps (Native) |

### When to Pick Which
- **Jenkins**: Maximum flexibility and you have a dedicated DevOps team to maintain it.
- **GitHub Actions**: Your code lives on GitHub and you want the fastest time-to-CI.
- **GitLab CI**: Your code lives on GitLab or you want an all-in-one DevOps platform.
- **CircleCI**: You need the fastest possible CI with smart caching and parallelism.
- **ArgoCD**: You deploy to Kubernetes and want Git as the single source of truth (GitOps).

---

# 2. Containerization

| Feature | Docker |
| :--- | :--- |
| **Type** | Container platform |
| **Config File** | `Dockerfile` + `docker-compose.yml` |
| **Image Registry** | Docker Hub, GHCR, ECR, GCR, ACR |
| **Orchestration** | Docker Compose (single host) / Swarm (multi-host) |
| **Networking** | Bridge, Host, Overlay, None |
| **Volume Support** | Bind mounts, Named volumes, tmpfs |
| **Health Checks** | Built-in `HEALTHCHECK` instruction |
| **Multi-Stage Builds** | ✅ Yes |
| **GPU Support** | ✅ Yes (NVIDIA runtime) |
| **OS Support** | Linux, macOS, Windows |
| **Best For** | Packaging applications into portable, reproducible containers |

> **Note**: Docker is not compared against other containerization tools here because it is the overwhelming industry standard. Alternatives like Podman exist but have much smaller adoption.

---

# 3. Container Orchestration

| Feature | Kubernetes | HashiCorp Nomad | Helm | Docker Compose |
| :--- | :--- | :--- | :--- | :--- |
| **Type** | Full Orchestrator | Simple Scheduler | K8s Package Manager | Dev Orchestrator |
| **Philosophy** | "Kitchen Sink" (Batteries included) | "Unix Way" (Does one thing well) | Packaging & Templating | Local Development |
| **Architecture** | Complex (Master/Worker) | Simple (Single binary) | Client-side only | Single host |
| **Workloads** | Containers only | Containers, Binaries, Java, QEMU | N/A | Containers |
| **Service Discovery** | Built-in (CoreDNS) | Integrates with Consul | N/A | Container names |
| **Secrets** | Built-in Secrets | Integrates with Vault | N/A | `.env` files |
| **Scale** | Global Standard | High performance / Low overhead | N/A | Single node |
| **Learning Curve** | High | Medium | Medium | Very Low |
| **Best For** | Massive, complex K8s clusters | Simple, multi-workload clusters | Managing K8s apps | Local dev / Small apps |

### When to Pick Which
- **Docker Compose**: Local development or a simple app (1-5 services) on a single server.
- **Docker Swarm**: Basic multi-host orchestration without Kubernetes complexity.
- **Kubernetes**: Production at scale with auto-scaling, self-healing, and rolling deployments.
- **Helm**: You use Kubernetes and want to install/manage complex apps with a single command.

---

# 4. Infrastructure as Code & Server Tools

| Feature | Terraform | Pulumi | Ansible | AWS CLI | Vault | Nginx | Traefik |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Type** | Provisioning | Provisioning | Config Mgmt | Cloud CLI | Secret Mgmt | Web Server | Ingress/Proxy |
| **Language** | HCL | TS/Py/Go/Java | YAML | CLI Commands | HCL/JSON | Nginx DSL | Label-based |
| **Approach** | Declarative | Declarative | Procedural | Imperative | API-based | Declarative | Dynamic |
| **State** | ✅ Yes | ✅ Yes | ❌ No | ❌ No | ✅ Yes | ❌ No | ✅ In-memory |
| **Testing** | ⚠️ Limited | ✅ Standard (Jest) | ❌ No | ❌ No | N/A | N/A | N/A |
| **Learning Curve**| Medium | Medium (if dev) | Low-Medium | Low | Medium | Low | Low |
| **Best For** | Infra teams | Dev teams | Server config | Ad-hoc cloud | Protection | Static/Legacy | Microservices |

### How They Work Together
```
Terraform        Ansible          Vault            Nginx
   │                │                │                │
   ▼                ▼                ▼                ▼
Provisions     Configures       Provides          Routes
the server →   software on  →   secrets to   →    traffic
(AWS EC2)      it (Node.js)     the app            to app
```

- **Terraform** creates the infrastructure (servers, databases, networks).
- **Ansible** configures the software running on that infrastructure.
- **Vault** securely provides secrets (DB passwords, API keys) to applications.
- **Nginx** sits in front of your application, routing and load balancing traffic.

---

# 5. Monitoring & Observability

| Feature | Prometheus | OpenTelemetry | Datadog | ELK Stack |
| :--- | :--- | :--- | :--- | :--- |
| **Role** | Metrics Storage/Query | Instrumentation Standard | All-in-one SaaS | Log Management |
| **Data Type** | Metrics only | Traces, Metrics, Logs | Traces, Metrics, Logs | Logs mostly |
| **Philosophy** | Pull-based (Scraping) | Push-based (SDKs) | SaaS (Agent-based) | Pipeline-based |
| **Vendor Lock-in** | Low (Open Source) | **Zero** (Standard API) | High (SaaS) | Low (Open Source) |
| **Backend Needed**| Yes (itself) | Yes (Jaeger, Prometheus) | No (SaaS) | Yes (Elasticsearch) |
| **Best For** | K8s native metrics | Future-proofing instrumentation | Enterprises wanting a single UI | High-volume log search |

### The Four Pillars of Observability
```
┌───────────────────────────────────────────────────────────┐
│                     Your Application                       │
│                                                            │
│  /metrics     stdout/stderr     SDK errors     Traces      │
│     │              │                │             │         │
└─────┼──────────────┼────────────────┼─────────────┼─────────┘
      │              │                │             │
 ┌────▼─────┐  ┌─────▼─────┐  ┌──────▼──────┐ ┌────▼──────┐
 │Prometheus│  │ Logstash  │  │   Sentry    │ │  Jaeger   │
 │(metrics) │  │  (logs)   │  │  (errors)   │ │ (traces)  │
 └────┬─────┘  └─────┬─────┘  └─────────────┘ └───────────┘
      │              │
 ┌────▼─────┐  ┌─────▼──────────┐
 │ Grafana  │  │ Elasticsearch  │
 │(dashboard│  │ + Kibana       │
 └──────────┘  └────────────────┘
```

- **Prometheus + Grafana** = Metrics ("CPU at 95%")
- **ELK Stack** = Logs ("Connection refused at line 42")
- **Sentry** = Errors ("TypeError in checkout flow, 342 users affected")

---

# 6. Code Quality & Security

| Feature | SonarQube | Trivy |
| :--- | :--- | :--- |
| **Type** | Static code analysis | Security scanner |
| **Purpose** | Find bugs, code smells, vulnerabilities in source code | Find CVEs in images, code, IaC |
| **What It Scans** | Source code (30+ languages) | Docker images, filesystems, K8s, Git repos |
| **Vulnerability Detection** | ✅ OWASP Top 10 in code | ✅ CVE database for dependencies |
| **Code Smells** | ✅ Yes | ❌ No |
| **Secret Detection** | ⚠️ Limited | ✅ Yes |
| **IaC Scanning** | ❌ No | ✅ Dockerfile, Terraform, K8s YAML |
| **Quality Gates** | ✅ Pass/fail CI builds | ✅ Fail on severity threshold |
| **CI Integration** | GitHub Actions, GitLab, Jenkins | GitHub Actions, GitLab, any CI |
| **Self-Hosted** | ✅ Yes (Community Edition) | ✅ Yes (CLI tool) |
| **Cost** | Free (CE) / Paid (EE) | Free (open source) |
| **Best For** | Code quality & tech debt | Container & dependency security |

### When to Use Both
- **SonarQube** runs on your **source code** to catch bugs and bad patterns before they reach production.
- **Trivy** runs on your **built artifacts** (Docker images, IaC configs) to catch vulnerable dependencies and misconfigurations.

Using both gives you security coverage across the entire pipeline: code → build → deploy.

---

# Master Cheat Sheet — All Tools

| Tool | Category | Purpose | Learning Curve |
| :--- | :--- | :--- | :--- |
| **Jenkins** | CI/CD | Flexible pipelines | Medium-High |
| **GitHub Actions** | CI/CD | GitHub-native automation | Low |
| **ArgoCD / Flux** | CI/CD | K8s GitOps (Pull-based) | Medium |
| **Docker** | Container | Packaging applications | Low |
| **Kubernetes** | Orchestration | Container management at scale | High |
| **Nomad** | Orchestration | Simple multi-workload scheduler | Medium |
| **Terraform / Pulumi**| IaC | Provisioning infrastructure | Medium |
| **Ansible** | IaC | Server configuration | Low-Medium |
| **Vault** | Security | Secret & Key management | Medium |
| **AWS / GCP / Azure** | Cloud | Infrastructure hosting | High (vast) |
| **Prometheus / OTel** | Observability | Metrics and tracing | Medium |
| **ELK Stack** | Observability | Centralized logging | Medium-High |
| **Nginx / Caddy** | Server | Reverse proxy and HTTP server | Low |
| **Trivy / SonarQube** | Security | Vulnerability & Code scanning | Low-Medium |
