# Jenkins Installation & Configuration Guide

## 1. Installation Methods

### Option A: Docker (Recommended)
The fastest way to get Jenkins running locally:
```bash
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts-jdk17
```
Then open `http://localhost:8080` and follow the setup wizard.

Get the initial admin password:
```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

### Option B: Native Install (Linux)
```bash
# Add Jenkins repo
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install
sudo apt-get update
sudo apt-get install jenkins

# Start
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

### Option C: Windows
Download the MSI installer from https://www.jenkins.io/download/ and follow the graphical wizard.

---

## 2. Initial Setup Checklist

After installation, complete these steps:

- [ ] Unlock Jenkins with the initial admin password
- [ ] Install suggested plugins (or select manually)
- [ ] Create first admin user
- [ ] Configure Jenkins URL (`Manage Jenkins → System → Jenkins URL`)
- [ ] Install additional plugins as needed

---

## 3. Essential Plugin Configuration

### Node.js Plugin
`Manage Jenkins → Tools → NodeJS installations`
```
Name: NodeJS-20
Version: 20.x
Global npm packages: npm@latest
```

### Docker Plugin
`Manage Jenkins → Plugins → Available → Docker Pipeline`
Allows building and pushing Docker images directly in pipeline scripts.

### Credentials
`Manage Jenkins → Credentials → System → Global credentials`

| Credential Type | Use Case |
| :--- | :--- |
| Username with password | Docker registries, Git repos |
| SSH Username with private key | Server deployments |
| Secret text | API tokens, webhooks |
| Secret file | Kubeconfig, SSL certificates |

---

## 4. Connecting to Git Repositories

### GitHub Integration
1. Install **GitHub** and **GitHub Branch Source** plugins.
2. Create a Personal Access Token (PAT) on GitHub with `repo` scope.
3. Add credential in Jenkins: `Username with password` (username = your GitHub username, password = PAT).
4. Create a new **Multibranch Pipeline** job → Add GitHub source → Select the repo.

### GitLab Integration
1. Install the **GitLab** plugin.
2. Generate a GitLab API token with `api` scope.
3. `Manage Jenkins → System → GitLab` → Add connection.
4. Configure webhook in GitLab: `Settings → Webhooks → URL: http://jenkins-url/project/job-name`.

---

## 5. Agent / Node Configuration

### Why Agents?
The Jenkins controller should **not** run builds. Distribute workloads to agents (worker machines).

### Adding a Permanent Agent
`Manage Jenkins → Nodes → New Node`
```
Name: build-agent-01
Remote root directory: /home/jenkins
Labels: linux docker node20
Launch method: Launch via SSH
  Host: 192.168.1.100
  Credentials: (SSH key)
```

### Docker-Based Agents
Run each build inside a fresh Docker container:
```groovy
pipeline {
    agent {
        docker {
            image 'node:20-alpine'
            args '-v /tmp:/tmp'
        }
    }
    stages {
        stage('Build') {
            steps { sh 'node --version' }
        }
    }
}
```

---

## 6. Security Best Practices

- [ ] Enable **CSRF Protection** (enabled by default)
- [ ] Use **Role-Based Access Control** (install Role Strategy plugin)
- [ ] Never store secrets in Jenkinsfile — use the **Credentials** plugin
- [ ] Run Jenkins behind a **reverse proxy** (Nginx/Apache) with HTTPS
- [ ] Restrict agent-to-controller access (`Manage Jenkins → Security → Agent → Controller Access Control`)
- [ ] Keep Jenkins and all plugins **up to date**
