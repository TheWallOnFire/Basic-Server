# Pulumi

## Description
Pulumi is an Infrastructure as Code (IaC) tool that allows you to use standard programming languages (TypeScript, Python, Go, .NET, Java) to define and deploy cloud infrastructure, instead of using domain-specific languages like HCL (Terraform).

## How it works
You write code in your favorite language using Pulumi's SDK. When you run `pulumi up`, Pulumi calculates the difference between your code and the current state of the cloud provider and applies the changes.

## How to code it (TypeScript)
```typescript
import * as aws from "@pulumi/aws";

// Create an AWS S3 bucket
const bucket = new aws.s3.Bucket("my-bucket", {
    website: {
        indexDocument: "index.html",
    },
});

// Export the name of the bucket
export const bucketName = bucket.id;
```

## Features
- **Use Real Languages**: Use loops, functions, and classes to manage infrastructure.
- **Strong Typing**: Get IDE autocomplete and compile-time checks.
- **Native Providers**: Direct access to 100% of AWS, Azure, and Google Cloud resources.
- **State Management**: Managed via Pulumi Cloud (default) or self-hosted backends.
- **Testing**: Use standard unit testing frameworks (Jest, PyTest) to test your infra.
