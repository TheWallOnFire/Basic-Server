# Harbor

## Description
Harbor is an open-source trusted cloud native registry project that stores, signs, and scans content. It is the enterprise-grade alternative to a simple Docker Registry.

## Key Features
- **Vulnerability Scanning**: Automatically scans images for CVEs using Trivy.
- **Role-Based Access Control (RBAC)**: Fine-grained permissions for users and teams.
- **Image Replication**: Sync images between different Harbor instances or public registries.
- **Content Trust**: Sign images using Notary to ensure they haven't been tampered with.
- **Helm Chart Repository**: Can store Helm charts alongside Docker images.

## Why Harbor?
- **Self-Hosted**: Perfect for organizations that cannot use public cloud registries.
- **Compliance**: Provides audit logs of who accessed what and when.
- **Garbage Collection**: Cleans up old image layers to save disk space.
