# Infracost

## Description
Infracost shows cloud cost estimates for Terraform in pull requests. It helps DevOps engineers and SREs see how much their infrastructure changes will cost before they are deployed.

## How it works
Infracost parses your Terraform HCL and matches it against its Cloud Pricing API to calculate the monthly cost.

## How to use it
```bash
# In your CI/CD pipeline
infracost diff --path . \
               --usage-file infracost-usage.yml \
               --format json \
               --out-file report.json

# Post a comment to GitHub PR
infracost comment github --path report.json \
                         --repo my-org/my-repo \
                         --pull-request $PR_NUMBER \
                         --token $GITHUB_TOKEN
```

## Features
- Supports 200+ AWS, Azure, and GCP resources.
- Native integration with GitHub Actions, GitLab CI, and Atlantis.
- "Usage-based" costs (e.g., S3 storage, Lambda requests).
- **Policy Enforcement**: Block PRs that increase costs by more than a certain amount.
