# CI/CD & DevOps Tools — Comprehensive Comparison

This document compares every tool in the CI/CD & Orchestration section, organized by category.

---

# 1. CI/CD Platforms

| Feature | Jenkins | GitHub Actions | GitLab CI | CircleCI | ArgoCD |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Type** | Self-hosted server | Cloud service | Cloud / Self-hosted | Cloud service | GitOps CD for K8s |
| **Config File** | `Jenkinsfile` | `.github/workflows/*.yml` | `.gitlab-ci.yml` | `.circleci/config.yml` | `Application` CRD YAML |
| **Config Language** | Groovy | YAML | YAML | YAML | YAML |
| **Hosting** | Self-hosted only | GitHub-hosted or self-hosted | GitLab.com or self-hosted | Cloud or self-hosted | Self-hosted (in K8s) |
| **Free Tier** | Free (self-host) | 2,000 min/month | 400 min/month | 6,000 min/month | Free (open source) |
| **Approach** | Push-based CI/CD | Push-based CI/CD | Push-based CI/CD | Push-based CI/CD | Pull-based GitOps |
| **Container Support** | Via Docker plugin | Native | Native (DinD) | Native (first-class) | Kubernetes-native |
| **Parallel Execution** | `parallel` directive | Matrix strategy | DAG with `needs` | Parallelism split | N/A (per-app sync) |
| **Manual Approval** | `input` step | Environments | `when: manual` | Approval jobs | Manual sync button |
| **Secrets** | Credentials plugin | Repo/Env Secrets | CI/CD Variables | Contexts | K8s Secrets / Vault |
| **Self-Hosted** | All self-hosted | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Always |
| **K8s Native** | ❌ No | ❌ No | ❌ No | ❌ No | ✅ Yes (built for K8s) |
| **Learning Curve** | Medium-High | Low | Low-Medium | Low | Medium |
| **Best For** | Enterprise pipelines | GitHub projects | GitLab projects | Fast Docker CI | K8s GitOps deploys |

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

| Feature | Kubernetes | Helm | Docker Compose | Docker Swarm |
| :--- | :--- | :--- | :--- | :--- |
| **Type** | Container orchestrator | K8s package manager | Dev orchestrator | Simple orchestrator |
| **Scale** | Thousands of nodes | N/A (manages K8s apps) | Single host | Tens of nodes |
| **Config File** | YAML manifests | `Chart.yaml` + `values.yaml` | `docker-compose.yml` | `docker-compose.yml` |
| **Templating** | ❌ Static YAML | ✅ Go templates | ❌ Static YAML | ❌ Static YAML |
| **Rollback** | `kubectl rollout undo` | `helm rollback` (versioned) | ❌ Manual | ❌ Manual |
| **Auto-Scaling** | ✅ HPA, VPA | N/A | ❌ No | ❌ No |
| **Self-Healing** | ✅ Pod restart | N/A | ❌ No | ✅ Service restart |
| **Service Discovery** | ✅ CoreDNS | N/A | ✅ Container name | ✅ DNS-based |
| **Package Sharing** | ❌ No | ✅ Artifact Hub / Charts | ❌ No | ❌ No |
| **Managed Services** | AWS EKS, GCP GKE, Azure AKS | N/A | N/A | N/A |
| **Learning Curve** | High | Medium | Very Low | Low |
| **Best For** | Production at scale | Installing K8s apps | Local dev environments | Simple clusters |

### When to Pick Which
- **Docker Compose**: Local development or a simple app (1-5 services) on a single server.
- **Docker Swarm**: Basic multi-host orchestration without Kubernetes complexity.
- **Kubernetes**: Production at scale with auto-scaling, self-healing, and rolling deployments.
- **Helm**: You use Kubernetes and want to install/manage complex apps with a single command.

---

# 4. Infrastructure as Code & Server Tools

| Feature | Terraform | Ansible | Vault | Nginx |
| :--- | :--- | :--- | :--- | :--- |
| **Type** | Infra provisioning | Configuration mgmt | Secret management | Web server / Proxy |
| **Purpose** | Create cloud resources | Configure servers | Store & manage secrets | Route HTTP traffic |
| **Config Language** | HCL (`.tf`) | YAML Playbooks | HCL / JSON / CLI | Nginx config syntax |
| **Approach** | Declarative | Procedural tasks | API-based | Declarative |
| **Agent Required** | No (API-based) | No (SSH-based) | No (API-based) | N/A (runs as service) |
| **State Management** | ✅ State file | ❌ Stateless | ✅ Internal storage | N/A |
| **Idempotent** | ✅ Yes | ✅ Yes | N/A | N/A |
| **Cloud Support** | AWS, Azure, GCP, 3000+ | Any SSH machine | Any platform | Any Linux/Docker |
| **Secret Handling** | Vault integration | Ansible Vault | ✅ Core purpose | SSL certificates |
| **Dynamic Secrets** | ❌ No | ❌ No | ✅ Yes (auto-rotating) | ❌ No |
| **Learning Curve** | Medium | Low-Medium | Medium | Low |
| **Best For** | Provisioning infra | Configuring apps | Protecting secrets | Load balancing |

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

# 5. Monitoring, Logging & Error Tracking

| Feature | Prometheus | Grafana | ELK Stack | Sentry |
| :--- | :--- | :--- | :--- | :--- |
| **Type** | Metrics collection | Visualization | Log management | Error tracking |
| **Data Type** | Time-series metrics | Any (data sources) | Logs / Text data | Errors / Exceptions |
| **Data Collection** | Pull (`/metrics`) | None (reads sources) | Push (Logstash/Beats) | Push (SDK in app) |
| **Storage** | Built-in TSDB | None | Elasticsearch | Built-in / PostgreSQL |
| **Query Language** | PromQL | Depends on source | Lucene / KQL | Search / Filters |
| **Alerting** | ✅ Alertmanager | ✅ Built-in | ✅ Kibana Alerts | ✅ Built-in |
| **Visualization** | Basic UI | ✅ Excellent (100+ panels) | ✅ Kibana dashboards | ✅ Issue dashboard |
| **K8s Integration** | ✅ Native | ✅ Via Prometheus | ✅ Via Filebeat | ✅ Via SDK |
| **Stack Traces** | ❌ No | ❌ No | ⚠️ If in logs | ✅ Full + source maps |
| **Session Replay** | ❌ No | ❌ No | ❌ No | ✅ Yes |
| **Performance Tracing** | ✅ Metrics-level | ✅ Visualization | ⚠️ APM add-on | ✅ Transaction traces |
| **Self-Hosted** | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes |
| **Resource Usage** | Low-Medium | Low | High (JVM) | Medium |
| **Best For** | "What is happening?" | Visualizing metrics | "Why did it happen?" | "What crashed?" |

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

| Tool | Category | Purpose | Config File | Learning Curve |
| :--- | :--- | :--- | :--- | :--- |
| **Jenkins** | CI/CD | Build, test, deploy pipelines | `Jenkinsfile` | Medium-High |
| **GitHub Actions** | CI/CD | Build, test, deploy pipelines | `.github/workflows/*.yml` | Low |
| **GitLab CI** | CI/CD | Build, test, deploy pipelines | `.gitlab-ci.yml` | Low-Medium |
| **CircleCI** | CI/CD | Build, test, deploy pipelines | `.circleci/config.yml` | Low |
| **ArgoCD** | CI/CD (GitOps) | Git-based K8s deployments | `Application` CRD YAML | Medium |
| **Docker** | Container | Package applications | `Dockerfile` | Low |
| **Kubernetes** | Orchestration | Run containers at scale | YAML manifests | High |
| **Helm** | Orchestration | K8s package manager | `Chart.yaml` + `values.yaml` | Medium |
| **Docker Compose** | Orchestration | Multi-container apps (local) | `docker-compose.yml` | Very Low |
| **Terraform** | IaC | Provision cloud infrastructure | `.tf` files | Medium |
| **Ansible** | IaC | Configure servers and software | YAML Playbooks | Low-Medium |
| **Vault** | IaC | Secret management | HCL / CLI / API | Medium |
| **Nginx** | Server | Reverse proxy, load balancing | `nginx.conf` | Low |
| **Prometheus** | Monitoring | Collect and alert on metrics | `prometheus.yml` | Medium |
| **Grafana** | Monitoring | Visualize metrics dashboards | Web UI / YAML | Low |
| **ELK Stack** | Logging | Centralized log management | `logstash.conf` + Kibana | Medium-High |
| **Sentry** | Error Tracking | Runtime error capturing | SDK integration | Low |
| **SonarQube** | Code Quality | Static code analysis | `sonar-project.properties` | Low-Medium |
| **Trivy** | Security | Container & dependency scanning | CLI flags | Low |
