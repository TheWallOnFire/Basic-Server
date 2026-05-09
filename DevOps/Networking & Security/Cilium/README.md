# Cilium

## Description
Cilium is an open-source software for transparently securing the network connectivity between application services deployed using Linux container management platforms like Docker and Kubernetes.

## Why Cilium? (eBPF Power)
Unlike traditional networking tools that use slow IPTables, Cilium uses **eBPF** (Extended Berkeley Packet Filter) to process network packets directly in the Linux kernel. This makes it incredibly fast and scalable.

## Key Capabilities
- **High Performance Networking**: Direct routing and load balancing.
- **Network Security**: Layer 3, 4, and 7 (HTTP, gRPC, Kafka) policy enforcement.
- **Observability (Hubble)**: Deep visibility into network flows with service maps.
- **Service Mesh (Sidecar-less)**: Provides mTLS and traffic management without needing an Istio/Linkerd sidecar in every pod.

## How to code it (NetworkPolicy)
```yaml
apiVersion: "cilium.io/v2"
kind: CiliumNetworkPolicy
metadata:
  name: "allow-only-internal"
spec:
  endpointSelector:
    matchLabels:
      role: backend
  ingress:
  - fromEndpoints:
    - matchLabels:
        role: frontend
    toPorts:
    - ports:
      - port: "8080"
        protocol: TCP
```

## Features
- Identity-based security (no more IP-based rules).
- Multi-cluster connectivity (ClusterMesh).
- Transparent encryption (IPsec / WireGuard).
- Integrated with Kubernetes Gateway API.
