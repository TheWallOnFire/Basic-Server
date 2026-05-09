# FluxCD

## Description
FluxCD is a set of continuous and progressive delivery solutions for Kubernetes that are open source and maintain a declarative state. Like ArgoCD, it is a primary tool for implementing **GitOps**.

## How it works
Flux runs as an operator inside your Kubernetes cluster. It watches a Git repository (or Helm repository, or S3 bucket) and automatically updates the cluster state to match the configuration in Git. Unlike ArgoCD, Flux is designed to be "invisible" and managed primarily via `kubectl` and Git, without a mandatory heavy UI.

## How to code it
```bash
# Bootstrap Flux on a GitHub repo
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=fleet-infra \
  --branch=main \
  --path=./clusters/my-cluster \
  --personal
```

```yaml
# GitRepository Source
apiVersion: source.toolkit.fluxcd.io/v1
kind: GitRepository
metadata:
  name: podinfo
  namespace: flux-system
spec:
  interval: 1m
  url: https://github.com/stefanprodan/podinfo
  ref:
    branch: master

# Kustomization (Sync)
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: podinfo
  namespace: flux-system
spec:
  interval: 5m
  path: "./kustomize"
  prune: true
  sourceRef:
    kind: GitRepository
    name: podinfo
```

## Features
- Native Kubernetes integration (CRDs).
- Supports Kustomize and Helm.
- Automatic image updates (detects new Docker images and updates Git).
- Multi-tenancy and multi-cluster support.
- Part of the CNCF.
