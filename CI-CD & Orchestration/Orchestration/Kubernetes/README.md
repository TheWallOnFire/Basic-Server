# Kubernetes

## Description
Kubernetes (often abbreviated as K8s) is an open-source container orchestration system for automating software deployment, scaling, and management. Originally designed by Google, it is now maintained by the Cloud Native Computing Foundation.

## How it works
Kubernetes works by managing a cluster of worker machines, called nodes, that run containerized applications. The control plane manages the workers and the pods (the smallest deployable computing units) in the cluster. Developers define the desired state of their applications via declarative configuration files (YAML), and Kubernetes continuously works to ensure the actual state matches the desired state (e.g., automatically restarting failed containers or scaling up under load).

## How to code it
Here is a basic example of a Kubernetes Deployment configuration:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

## Features it supports
- Automated rollouts and rollbacks
- Service discovery and load balancing
- Storage orchestration (local, cloud, network)
- Self-healing (restarts containers that fail)
- Secret and configuration management
- Horizontal auto-scaling

## Real projects about it
- **Spotify**: Migrated from a homegrown orchestration tool to Kubernetes for massive scale.
- **Pinterest**: Uses Kubernetes to manage their massive microservices architecture.
- **OpenAI**: Relies on Kubernetes to orchestrate their massive deep learning training experiments.
