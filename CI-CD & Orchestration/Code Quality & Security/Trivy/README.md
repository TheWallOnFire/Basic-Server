# Trivy

## Description
Trivy is a comprehensive, all-in-one open-source security scanner by Aqua Security. It scans container images, file systems, Git repositories, and Kubernetes clusters for vulnerabilities, misconfigurations, secrets, and license issues.

## How it works
Trivy downloads a vulnerability database and scans your target (image, filesystem, or repo) against it. Results are returned instantly with severity levels (CRITICAL, HIGH, MEDIUM, LOW).

## How to code it
```bash
# Scan a Docker image
trivy image nginx:latest

# Scan only critical and high vulnerabilities
trivy image --severity CRITICAL,HIGH my-app:1.0

# Scan a local project directory
trivy fs .

# Scan for secrets in code
trivy fs --scanners secret .

# Scan Kubernetes cluster
trivy k8s --report summary cluster
```

### CI Integration (GitHub Actions)
```yaml
- name: Run Trivy vulnerability scanner
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: 'my-app:${{ github.sha }}'
    format: 'sarif'
    output: 'trivy-results.sarif'
    severity: 'CRITICAL,HIGH'
```

## Features it supports
- Container image vulnerability scanning
- Filesystem and Git repository scanning
- Infrastructure as Code (IaC) misconfiguration detection (Terraform, Dockerfile, K8s)
- Secret detection in source code
- SBOM (Software Bill of Materials) generation
- Multiple output formats (table, JSON, SARIF)
- Offline/air-gapped scanning support
