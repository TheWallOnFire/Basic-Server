# AWS CLI

## Description
The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

## How to use it
```bash
# Configure credentials
aws configure

# S3 Operations
aws s3 ls                          # List buckets
aws s3 sync ./local-folder s3://my-bucket  # Sync folder to S3

# EC2 Operations
aws ec2 describe-instances         # List instances
aws ec2 start-instances --instance-ids i-1234567890abcdef0

# IAM Operations
aws iam list-users                 # List all users

# Lambda Operations
aws lambda list-functions          # List all functions
```

## Why it's essential
- **Automation**: Scripting repetitive tasks.
- **Speed**: Often faster than navigating the AWS Management Console.
- **CI/CD**: Used in GitHub Actions/Jenkins to deploy to AWS.
- **Security**: Can be used with IAM roles and MFA.
