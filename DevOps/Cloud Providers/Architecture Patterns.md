# Cloud Architecture Patterns

## 1. Single Cloud
Using one provider (e.g., AWS) for everything.
- **Pros**: Simple, fast, deep integration.
- **Cons**: Vendor lock-in, single point of failure (provider-wide outage).

## 2. Multi-Cloud
Using two or more providers (e.g., AWS for compute, GCP for Data).
- **Pros**: Avoid lock-in, pick the "best" tool for each job.
- **Cons**: High complexity, data egress costs, double networking overhead.

## 3. Hybrid Cloud
Connecting on-premise data centers with the public cloud.
- **Pros**: Keep sensitive data on-prem, use cloud for "burst" capacity.
- **Cons**: Complex networking (VPN/Direct Connect), latency.

## 4. Serverless First
Prioritizing FaaS (Lambda/Functions) and managed services over VMs.
- **Pros**: No server management, infinite scale, pay-per-use.
- **Cons**: Cold starts, vendor lock-in, harder to debug/test locally.

## 5. Microservices vs. Monolith
- **Monolith**: One large cloud instance (EC2/VM) running everything.
- **Microservices**: Many small containers (EKS/GKE) communicating over a network.

## 6. Infrastructure as Code (IaC)
Treating your cloud setup as software.
- **Terraform**: The tool of choice for multi-cloud.
- **CloudFormation/ARM/GDM**: Cloud-native tools for single-cloud.

---

## Cost Optimization (FinOps)
- **Reserved Instances (RI)**: Commit to 1-3 years for 70% discount.
- **Savings Plans**: Commit to an hourly spend for flexibility.
- **Spot Instances**: Use excess cloud capacity for up to 90% discount (can be terminated anytime).
- **Right-sizing**: Monitor CloudWatch to see if your instances are over-provisioned.
