# Linkerd

## Description
Linkerd is an ultra-light, ultra-fast, security-first **Service Mesh** for Kubernetes. It is simpler and lighter than Istio.

## Why Linkerd? (vs Istio)
- **Zero Config**: Works out of the box with almost no configuration.
- **Performance**: Written in Rust, it has significantly lower CPU and memory overhead than Istio (which is written in C++/Go).
- **Simplicity**: Focuses only on the core service mesh features (mTLS, retries, timeouts, telemetry).

## How to use it
```bash
# Check if your cluster is ready
linkerd check --pre

# Install onto your cluster
linkerd install | kubectl apply -f -

# Inject Linkerd into your application
kubectl get deploy my-app -o yaml | linkerd inject - | kubectl apply -f -
```

## Features
- **mTLS by Default**: All traffic between meshed services is encrypted automatically.
- **Golden Metrics**: Real-time monitoring of success rates, latencies, and request volumes.
- **Load Balancing**: Advanced gRPC and HTTP/2 load balancing.
- **Traffic Splitting**: Supports blue-green and canary deployments via SMI.
