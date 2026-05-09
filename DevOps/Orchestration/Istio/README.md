# Istio

## Description
Istio is an open-source **Service Mesh** that provides a uniform way to connect, secure, control, and observe microservices. It handles the "traffic management" between services in a Kubernetes cluster.

## How it works
Istio injects a proxy (Envoy) as a "sidecar" into every pod in your cluster. All network traffic between services passes through these proxies, allowing Istio to control and monitor the communication without changing the application code.

## How to code it (VirtualService)
```yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: my-app-route
spec:
  hosts:
  - my-app
  http:
  - route:
    - destination:
        host: my-app
        subset: v1
      weight: 90
    - destination:
        host: my-app
        subset: v2
      weight: 10
```

## Features
- **Traffic Management**: Canary deployments, blue-green deployments, and circuit breaking.
- **Security**: Mutual TLS (mTLS) between services automatically.
- **Observability**: Distributed tracing and detailed metrics.
- **Policy Enforcement**: Rate limiting and access control.
- **Multi-cluster**: Connect services across different K8s clusters.
