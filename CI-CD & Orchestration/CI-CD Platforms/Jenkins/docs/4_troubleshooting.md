# Jenkins Troubleshooting & Tips

## Common Issues

### 1. "Permission Denied" When Running Docker
**Symptom**: `docker: Got permission denied while trying to connect to the Docker daemon socket`
**Fix**: Add the Jenkins user to the Docker group on the agent:
```bash
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

### 2. Pipeline Hangs at `input` Step
**Symptom**: Pipeline waits forever for approval.
**Fix**: Use a `timeout` block around input steps:
```groovy
timeout(time: 1, unit: 'HOURS') {
    input message: 'Deploy to production?'
}
```

### 3. Node Modules Cache Not Working
**Symptom**: `npm ci` runs fresh on every build, even though `package-lock.json` didn't change.
**Fix**: Persist the cache directory explicitly:
```groovy
options {
    skipDefaultCheckout()
}
stages {
    stage('Install') {
        steps {
            checkout scm
            cache(maxCacheSize: 500, caches: [
                arbitraryFileCache(path: 'node_modules', cacheValidityDecidingFile: 'package-lock.json')
            ]) {
                sh 'npm ci'
            }
        }
    }
}
```

### 4. Builds Fail with "No Space Left on Device"
**Fix**: Add a periodic cleanup job:
```groovy
pipeline {
    agent any
    triggers { cron('H 2 * * 0') } // Every Sunday at 2 AM
    stages {
        stage('Cleanup') {
            steps {
                sh 'docker system prune -af --volumes'
            }
        }
    }
}
```

---

## Performance Tips

1. **Use `agent { docker { image '...' } }`** for disposable build environments.
2. **Parallelize** independent stages (linting + testing simultaneously).
3. **Use `stash`/`unstash`** to pass small files between stages without re-cloning.
4. **Set `disableConcurrentBuilds()`** to prevent race conditions on shared resources.
5. **Archive only what you need** — don't archive `node_modules` or build caches.
