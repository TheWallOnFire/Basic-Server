# Falco

## Description
Falco is a cloud-native runtime security tool. it is the "security camera" for your Kubernetes cluster, detecting abnormal behavior and threats in real-time.

## How it works
Falco uses a kernel module or eBPF to monitor system calls. It matches these calls against a set of rules and alerts you when something suspicious happens.

## What it detects
- **Unauthorized Shells**: Someone running `bash` inside a production container.
- **Suspicious File Access**: A process reading `/etc/shadow`.
- **Privilege Escalation**: A container trying to gain root access.
- **Network Anomalies**: A container making unexpected outbound connections.

## How to code it (Rule Example)
```yaml
- rule: Shell run in container
  desc: A shell was spawned in a container with a terminal attached
  condition: >
    container.id != host and
    proc.name = bash and
    evt.type = execve
  output: >
    Shell spawned in container (user=%user.name container_id=%container.id)
  priority: WARNING
```

## Features
- Deep visibility into container activity.
- Integrated with Kubernetes Audit Logs.
- Low performance overhead (via eBPF).
- Alerts via Slack, PagerDuty, or Webhooks.
