# GitLab CI

## Description
GitLab CI/CD is a tool built into GitLab for software development through continuous integration, continuous delivery, and continuous deployment. It allows teams to automate the building, testing, and deployment of their code natively within the same platform they use for source control.

## How it works
GitLab CI/CD relies on a file called `.gitlab-ci.yml` placed in the root of your repository. This file defines the scripts you want to run, along with any dependencies or environmental variables. When you push code, GitLab triggers "Runners" (isolated processes running on VMs, Docker containers, or physical machines) to execute the jobs defined in the pipeline.

## How to code it
Here is a basic example of a GitLab CI/CD pipeline:

```yaml
stages:
  - build
  - test
  - deploy

build_job:
  stage: build
  script:
    - echo "Compiling the code..."
    - make build

test_job:
  stage: test
  script:
    - echo "Running unit tests..."
    - make test

deploy_job:
  stage: deploy
  script:
    - echo "Deploying application..."
    - ./deploy.sh
  only:
    - main
```

## Features it supports
- Built-in container registry
- Auto DevOps (automatically builds, tests, configures, and deploys)
- Multi-platform and multi-language support
- Extensive caching and artifact management
- Seamless integration with Kubernetes

## Real projects about it
- **Ticketmaster**: Uses GitLab CI/CD to accelerate mobile delivery.
- **Siemens**: Relies on GitLab CI to manage thousands of developers and pipelines.
- **KDE**: The open-source community uses GitLab CI to build and test their desktop environment.
