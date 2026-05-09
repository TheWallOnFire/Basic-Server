# HashiCorp Nomad

## Description
Nomad is a simple and flexible scheduler and orchestrator to deploy and manage containers and non-containerized applications across on-prem and cloud at scale.

## Why Nomad? (vs Kubernetes)
- **Simplicity**: Nomad is a single binary and much easier to set up and manage than Kubernetes.
- **Flexibility**: Can orchestrate Docker containers, but also standalone binaries, Java jars, and VMs.
- **Federation**: Built-in support for multi-region and multi-cloud.
- **Ecosystem**: Integrates perfectly with Consul (service discovery) and Vault (secrets).

## How to code it (Job Spec)
```hcl
job "web-app" {
  datacenters = ["dc1"]
  type        = "service"

  group "web" {
    count = 3
    task "node-app" {
      driver = "docker"
      config {
        image = "node-app:latest"
        ports = ["http"]
      }
      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
```

## Features
- Binaries, Java, Docker, and QEMU drivers.
- Device plugins (GPU support).
- Task dependencies and lifecycles.
- High availability with leader election.
- Used by Cloudflare, Roblox, and DuckDuckGo.
