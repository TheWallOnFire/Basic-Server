# Terragrunt

## Description
Terragrunt is a thin wrapper that provides extra tools for keeping your configurations DRY (Don't Repeat Yourself), working with multiple Terraform modules, and managing remote state.

## Why use it?
- **DRY Configuration**: Define your remote state configuration once in a root file and inherit it in all child modules.
- **DRY CLI Arguments**: Define common CLI arguments (like `-var-file`) once.
- **Multiple Modules**: Easily manage infrastructure that is spread across dozens of Terraform modules.
- **Before/After Hooks**: Run custom scripts before or after Terraform commands.

## How to code it (terragrunt.hcl)
```hcl
# root/terragrunt.hcl
remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

# prod/app/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:foo/modules.git//app?ref=v1.0.0"
}

inputs = {
  instance_count = 10
  instance_type  = "m5.large"
}
```

## Features
- Execute commands on multiple modules concurrently (`run-all`).
- Automatic dependency management between modules.
- Support for IAM roles and AWS profiles.
- Integrated with Terraform Cloud and Enterprise.
