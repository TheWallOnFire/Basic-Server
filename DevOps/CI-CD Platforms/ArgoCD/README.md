# ArgoCD

## Description
ArgoCD is a declarative, GitOps-based continuous delivery tool for Kubernetes. It uses Git repositories as the source of truth for defining the desired application state and automates the deployment of applications to Kubernetes clusters.

## How it works
ArgoCD continuously monitors your Git repository for changes. When it detects a difference between the desired state (in Git) and the live state (in the K8s cluster), it syncs automatically or notifies you. This is the **GitOps** pattern — Git is the single source of truth.

```
Developer → Push YAML → Git Repo → ArgoCD detects → Syncs to Kubernetes
```

## How to code it
```yaml
# Application manifest
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/org/my-app-config.git
    targetRevision: main
    path: k8s/
  destination:
    server: https://kubernetes.default.svc
    namespace: production
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## Features it supports
- GitOps-based deployments (Git = source of truth)
- Web UI for visualizing application state
- Automatic or manual sync
- Rollback to any previous Git commit
- Multi-cluster management
- SSO integration (OIDC, LDAP, SAML)
- Health status monitoring for K8s resources

## Real projects about it
- **Intuit (TurboTax)**: Created ArgoCD and uses it across their entire fleet.
- **Tesla**: Uses ArgoCD for Kubernetes deployments.
- **Red Hat**: Integrates ArgoCD into OpenShift GitOps.
