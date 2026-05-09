# Terraform

## Description
Terraform is an open-source Infrastructure as Code (IaC) tool created by HashiCorp. It lets you define and provision data center infrastructure using a declarative configuration language called HCL (HashiCorp Configuration Language).

## How it works
You write `.tf` files describing the desired state of your infrastructure. Terraform compares the desired state with the actual state (stored in a state file), creates an execution plan showing what will change, and then applies those changes via cloud provider APIs.

## How to code it
```hcl
# main.tf — Provision an AWS EC2 instance
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"

  tags = {
    Name = "WebServer"
    Environment = "production"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}
```

### Essential Commands
```bash
terraform init      # Initialize, download provider plugins
terraform plan      # Preview changes before applying
terraform apply     # Apply changes to infrastructure
terraform destroy   # Tear down all managed infrastructure
terraform fmt       # Format .tf files
terraform validate  # Validate configuration syntax
```

## Features it supports
- Multi-cloud support (AWS, Azure, GCP, DigitalOcean, etc.)
- State management (local or remote via Terraform Cloud/S3)
- Modules for reusable infrastructure components
- Plan/Apply workflow (preview before changing)
- Import existing infrastructure into Terraform management
- Provider ecosystem with 3000+ providers

## Real projects about it
- **Uber**: Manages cloud infrastructure across regions with Terraform.
- **Twitch**: Uses Terraform for their AWS infrastructure.
- **Shopify**: Provisions and manages global infrastructure with Terraform.
