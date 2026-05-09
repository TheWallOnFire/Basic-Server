# AWS CDK (Cloud Development Kit)

## Description
The AWS CDK is an open-source software development framework to define your cloud application resources using familiar programming languages (TypeScript, Python, Java, .NET).

## Why CDK? (vs CloudFormation/Terraform)
- **Real Code**: Use loops, conditionals, and classes to define infrastructure.
- **High-level Abstractions**: Use "Constructs" that follow best practices and reduce boilerplate.
- **Type Safety**: IDE support and compile-time checks for your infrastructure.
- **Seamless Deployment**: CDK compiles down to CloudFormation templates but manages the deployment process for you.

## How to code it (TypeScript)
```typescript
import * as cdk from 'aws-cdk-lib';
import * as s3 from 'aws-cdk-lib/aws-s3';

export class MyStack extends cdk.Stack {
  constructor(scope: cdk.App, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    new s3.Bucket(this, 'MyFirstBucket', {
      versioned: true,
      removalPolicy: cdk.RemovalPolicy.DESTROY,
      autoDeleteObjects: true,
    });
  }
}
```

## Features
- **CDK Pipelines**: Self-updating CI/CD pipelines for your apps.
- **CDK Hotswap**: Fast deployments for development.
- **Construct Hub**: Share and use community-built infrastructure components.
- **Supports Local Testing**: Use with LocalStack for local AWS development.
