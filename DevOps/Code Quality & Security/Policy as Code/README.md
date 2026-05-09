# Open Policy Agent (OPA) & Kyverno

## Description
Policy as Code (PaC) allows you to define and enforce rules for your infrastructure and applications using code.

- **OPA**: A general-purpose policy engine that uses a language called **Rego**. It can be used for K8s, Terraform, APIs, and more.
- **Kyverno**: A Kubernetes-native policy engine that uses standard YAML. It is easier to use for K8s-specific rules but less flexible than OPA.

## Why use them?
- **Security**: Prevent containers from running as root.
- **Compliance**: Ensure all resources have mandatory labels (e.g., `owner`, `env`).
- **Cost**: Prevent developers from creating expensive `m5.24xlarge` instances.

## How to code it (Kyverno YAML)
```yaml
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: require-labels
spec:
  rules:
  - name: check-team-label
    match:
      resources:
        kinds:
        - Pod
    validate:
      message: "The label 'team' is required."
      pattern:
        metadata:
          labels:
            team: "?*"
```

## Features
- **Admission Control**: Block "bad" resources before they are created.
- **Mutation**: Automatically add missing configurations (e.g., default resource limits).
- **Generation**: Create new resources (e.g., a default NetworkPolicy for every new Namespace).
