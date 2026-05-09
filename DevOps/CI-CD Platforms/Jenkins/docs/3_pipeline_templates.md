# Jenkins Pipeline Patterns & Templates

This document provides production-ready pipeline templates for common project types.

---

## Template 1: Microservice Pipeline (Build → Test → Docker → Deploy)

This is the most common pipeline for a containerized microservice:

```groovy
pipeline {
    agent any

    options {
        timeout(time: 30, unit: 'MINUTES')
        timestamps()
        disableConcurrentBuilds()
    }

    environment {
        APP_NAME    = 'user-service'
        REGISTRY    = 'registry.example.com'
        IMAGE       = "${REGISTRY}/${APP_NAME}"
        VERSION     = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                script {
                    env.GIT_COMMIT_SHORT = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
                }
            }
        }

        stage('Install & Lint') {
            agent { docker { image 'node:20-alpine' } }
            steps {
                sh 'npm ci'
                sh 'npm run lint'
            }
        }

        stage('Test') {
            agent { docker { image 'node:20-alpine' } }
            steps {
                sh 'npm ci'
                sh 'npm test -- --ci --coverage'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: 'test-results/*.xml'
                }
            }
        }

        stage('Build Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE}:${VERSION}")
                }
            }
        }

        stage('Push Image') {
            when { branch 'main' }
            steps {
                script {
                    docker.withRegistry("https://${REGISTRY}", 'registry-credentials') {
                        dockerImage.push("${VERSION}")
                        dockerImage.push("${GIT_COMMIT_SHORT}")
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Deploy Staging') {
            when { branch 'main' }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'staging-ssh', keyFileVariable: 'SSH_KEY')]) {
                    sh """
                        ssh -i \$SSH_KEY -o StrictHostKeyChecking=no deploy@staging.example.com \
                        'docker pull ${IMAGE}:${VERSION} && docker compose -f /opt/app/docker-compose.yml up -d'
                    """
                }
            }
        }

        stage('Deploy Production') {
            when { branch 'main' }
            input { message "Approve production deployment?" }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'prod-ssh', keyFileVariable: 'SSH_KEY')]) {
                    sh """
                        ssh -i \$SSH_KEY -o StrictHostKeyChecking=no deploy@prod.example.com \
                        'docker pull ${IMAGE}:${VERSION} && docker compose -f /opt/app/docker-compose.yml up -d'
                    """
                }
            }
        }
    }

    post {
        success { echo "✅ Pipeline succeeded for ${APP_NAME} v${VERSION}" }
        failure { echo "❌ Pipeline failed for ${APP_NAME} v${VERSION}" }
        always  { cleanWs() }
    }
}
```

---

## Template 2: Monorepo Pipeline (Parallel Builds)

For repositories containing multiple services (e.g., `api/`, `web/`, `worker/`):

```groovy
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps { checkout scm }
        }

        stage('Detect Changes') {
            steps {
                script {
                    env.API_CHANGED    = sh(script: 'git diff --name-only HEAD~1 | grep "^api/" || true', returnStdout: true).trim()
                    env.WEB_CHANGED    = sh(script: 'git diff --name-only HEAD~1 | grep "^web/" || true', returnStdout: true).trim()
                    env.WORKER_CHANGED = sh(script: 'git diff --name-only HEAD~1 | grep "^worker/" || true', returnStdout: true).trim()
                }
            }
        }

        stage('Build & Test') {
            parallel {
                stage('API') {
                    when { expression { env.API_CHANGED != '' } }
                    agent { docker { image 'node:20-alpine' } }
                    steps {
                        dir('api') {
                            sh 'npm ci && npm test'
                        }
                    }
                }
                stage('Web') {
                    when { expression { env.WEB_CHANGED != '' } }
                    agent { docker { image 'node:20-alpine' } }
                    steps {
                        dir('web') {
                            sh 'npm ci && npm run build'
                        }
                    }
                }
                stage('Worker') {
                    when { expression { env.WORKER_CHANGED != '' } }
                    agent { docker { image 'python:3.12-slim' } }
                    steps {
                        dir('worker') {
                            sh 'pip install -r requirements.txt && pytest'
                        }
                    }
                }
            }
        }
    }
}
```

---

## Template 3: Shared Library Usage

For large organizations, extract common pipeline logic into a **Shared Library**:

```groovy
// In your Jenkinsfile
@Library('my-shared-library') _

standardPipeline(
    appName: 'payment-service',
    language: 'node',
    nodeVersion: '20',
    deployTargets: ['staging', 'production']
)
```

Setup: `Manage Jenkins → System → Global Pipeline Libraries`
```
Name: my-shared-library
Source: Git → https://github.com/org/jenkins-shared-library.git
```
