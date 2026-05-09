# Kubernetes Quick Reference

## Core Resources

| Resource | Purpose | Command |
| :--- | :--- | :--- |
| **Pod** | Smallest unit, runs one or more containers | `kubectl get pods` |
| **Deployment** | Manages ReplicaSets, handles rolling updates | `kubectl get deployments` |
| **Service** | Stable network endpoint for a set of Pods | `kubectl get services` |
| **Ingress** | External HTTP/HTTPS routing to Services | `kubectl get ingress` |
| **ConfigMap** | Store non-sensitive configuration | `kubectl get configmaps` |
| **Secret** | Store sensitive data (base64 encoded) | `kubectl get secrets` |
| **Namespace** | Virtual cluster for resource isolation | `kubectl get namespaces` |
| **HPA** | Auto-scale pods based on metrics | `kubectl get hpa` |

## Essential Commands

```bash
# ─── Cluster Info ───────────────────────────────
kubectl cluster-info
kubectl get nodes

# ─── Apply/Delete Config ───────────────────────
kubectl apply -f deployment.yml       # Create or update resources
kubectl delete -f deployment.yml      # Delete resources

# ─── Pods ───────────────────────────────────────
kubectl get pods                      # List pods
kubectl get pods -o wide              # Show node & IP info
kubectl describe pod <name>           # Detailed pod info
kubectl logs <pod-name>               # View logs
kubectl logs -f <pod-name>            # Follow logs
kubectl exec -it <pod-name> -- sh     # Shell into a pod

# ─── Deployments ────────────────────────────────
kubectl get deployments
kubectl scale deployment web-app --replicas=5
kubectl rollout status deployment web-app
kubectl rollout undo deployment web-app   # Rollback to previous version
kubectl rollout history deployment web-app

# ─── Services ──────────────────────────────────
kubectl get services
kubectl port-forward service/web-app-service 8080:80  # Local access

# ─── Debugging ──────────────────────────────────
kubectl get events --sort-by='.lastTimestamp'
kubectl top pods                       # CPU/Memory usage (requires metrics-server)
kubectl top nodes
```

## Service Types

| Type | Description |
| :--- | :--- |
| `ClusterIP` | Internal only (default). Accessible within the cluster. |
| `NodePort` | Exposes service on each node's IP at a static port (30000-32767). |
| `LoadBalancer` | Provisions a cloud load balancer (AWS ELB, GCP LB, etc.). |
| `ExternalName` | Maps a service to an external DNS name. |

## Rolling Update Strategy
```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxUnavailable: 1       # Max pods taken down during update
    maxSurge: 1             # Max extra pods created during update
```
This ensures zero-downtime deployments by gradually replacing old pods with new ones.
