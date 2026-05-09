# Infrastructure Provisioning (IaC)

## Description
Infrastructure as Code (IaC) is the managing and provisioning of infrastructure through code instead of through manual processes.

## Comparison Table

| Feature | Terraform | Pulumi | AWS CloudFormation |
| :--- | :--- | :--- | :--- |
| **Language** | HCL (HashiCorp) | TS, Py, Go, Java | JSON / YAML |
| **Cloud** | Multi-cloud | Multi-cloud | AWS Only |
| **State** | Local/Remote file | Pulumi Cloud / Remote | Managed by AWS |
| **Preview** | `terraform plan` | `pulumi preview` | Change Sets |
| **Learning Curve** | Medium | Low (for devs) | High |

## When to use what?
- **Terraform**: The industry standard for multi-cloud. Best for infrastructure teams.
- **Pulumi**: Best for developers who want to use their existing programming languages.
- **CloudFormation**: Best if you are 100% committed to AWS and want deep native integration.

## How to code it (CloudFormation)
```yaml
Resources:
  MyS3Bucket:
    Type: 'AWS::S3::Bucket'
    Properties:
      BucketName: my-cloudformation-bucket
      AccessControl: Private
```
