# Helm

## Description
Helm is the package manager for Kubernetes. It packages Kubernetes YAML manifests into reusable, versioned **Charts** — essentially a "one-click install" for complex Kubernetes applications (like installing PostgreSQL, Redis, or Nginx with a single command).

## How it works
Instead of managing dozens of individual YAML files, Helm bundles them into a Chart with templating support. You configure charts via a `values.yaml` file, and Helm renders the final YAML and deploys it to your cluster.

## How to code it

### Install a chart from a public repository
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-postgres bitnami/postgresql --set auth.postgresPassword=secret
```

### Create your own chart
```bash
helm create my-app
```
This generates:
```
my-app/
├── Chart.yaml          # Chart metadata
├── values.yaml         # Default configuration values
├── templates/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   └── _helpers.tpl
```

### values.yaml
```yaml
replicaCount: 3
image:
  repository: my-app
  tag: "1.0.0"
  pullPolicy: IfNotPresent
service:
  type: ClusterIP
  port: 80
```

### Essential Commands
```bash
helm install my-release ./my-chart       # Install a chart
helm upgrade my-release ./my-chart       # Upgrade a release
helm rollback my-release 1               # Rollback to revision 1
helm uninstall my-release                # Remove a release
helm list                                # List all releases
helm template ./my-chart                 # Render templates locally
```

## Features it supports
- Versioned chart packages
- Templating with Go templates and Sprig functions
- Release management (install, upgrade, rollback)
- Dependency management between charts
- Public and private chart repositories (Artifact Hub)
- Hooks (pre-install, post-upgrade, etc.)
