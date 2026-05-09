# Jenkins

## Description
Jenkins is a free and open-source automation server. It helps automate the parts of software development related to building, testing, and deploying, facilitating continuous integration (CI) and continuous delivery (CD).

## How it works
Jenkins is fundamentally a task runner. You define "Jobs" or "Pipelines" that describe a sequence of steps to execute. It listens to triggers (like a Git commit or a schedule) and executes the pipelines on controller nodes or distributes the workload across multiple agent nodes. Its functionality is heavily extended by thousands of plugins.

## How to code it
Here is a basic example of a Declarative `Jenkinsfile` for a build pipeline:

```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'make build'
            }
        }
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                sh 'make test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to staging server...'
                sh './deploy.sh staging'
            }
        }
    }
}
```

## Features it supports
- Massive plugin ecosystem supporting almost any tool
- Distributed builds across multiple machines
- Pipeline as Code via `Jenkinsfile`
- Easy installation and configuration via web interface
- Completely free and open-source

## Real projects about it
- **NASA**: Uses Jenkins for hardware and software testing.
- **Delivery Hero**: Uses Jenkins heavily to orchestrate its global deployment pipelines.
- **Twitch**: Utilizes Jenkins for their continuous integration environments.
