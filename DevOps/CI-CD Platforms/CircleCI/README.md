# CircleCI

## Description
CircleCI is a cloud-native continuous integration and delivery platform. It automates your software development process using intelligent caching, parallelism, and Docker layer caching to run pipelines extremely fast.

## How it works
CircleCI reads a `.circleci/config.yml` file from your repository. When you push code, CircleCI spins up an execution environment (Docker container, Linux VM, macOS VM, or Windows VM), runs your defined jobs, and reports results back to your Git provider (GitHub, Bitbucket, GitLab).

## How to code it
```yaml
# .circleci/config.yml
version: 2.1

orbs:
  node: circleci/node@5.0

jobs:
  test:
    docker:
      - image: cimg/node:20.0
    steps:
      - checkout
      - node/install-packages
      - run: npm test

  deploy:
    docker:
      - image: cimg/node:20.0
    steps:
      - checkout
      - run: ./deploy.sh

workflows:
  build-and-deploy:
    jobs:
      - test
      - deploy:
          requires: [test]
          filters:
            branches:
              only: main
```

## Features it supports
- Docker layer caching for fast image builds
- Orbs (reusable, shareable config packages)
- Parallelism (split tests across containers automatically)
- SSH debugging into failed builds
- Insights dashboard with pipeline analytics
- macOS and ARM execution environments

## Real projects about it
- **Spotify**: Uses CircleCI for their web platform CI.
- **Samsung**: Runs thousands of builds daily on CircleCI.
- **Stitch Fix**: Uses CircleCI for their data science pipeline.
