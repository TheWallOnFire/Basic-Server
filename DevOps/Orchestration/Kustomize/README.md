# Kustomize

## Description
Kustomize is a template-free way to customize Kubernetes manifests. It lets you define a "base" configuration and then apply "overlays" for different environments (dev, staging, prod) without using complex templates like Helm.

## How it works
Kustomize uses a `kustomization.yaml` file to describe how to modify existing YAML manifests. It is built directly into `kubectl` (`kubectl apply -k`).

## How to code it
### base/kustomization.yaml
```yaml
resources:
  - deployment.yaml
  - service.yaml
```

### overlays/production/kustomization.yaml
```yaml
resources:
  - ../../base
patches:
  - target:
      kind: Deployment
      name: my-app
    patch: |-
      - op: replace
        path: /spec/replicas
        value: 10
```

## Features
- **No Templates**: Pure YAML, no Go templates or string replacement.
- **Built-in to kubectl**: No extra tools to install.
- **Reusable Bases**: Share configuration across many apps.
- **Secret/ConfigMap Generators**: Automatically handles hash suffixes for rolling updates.
