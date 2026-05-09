# HashiCorp Vault

## Description
Vault is a tool for securely storing, accessing, and managing secrets (API keys, passwords, certificates, encryption keys). It provides a unified interface to any secret while enforcing tight access control and providing a detailed audit log.

## How it works
Applications authenticate to Vault (via tokens, Kubernetes service accounts, AWS IAM roles, etc.). Once authenticated, Vault checks their policy to determine what secrets they can access. Vault can also generate **dynamic secrets** — short-lived credentials that are automatically revoked after expiry.

## How to code it

### Store and Retrieve a Secret (CLI)
```bash
# Write a secret
vault kv put secret/myapp db_password="super-secret-123"

# Read a secret
vault kv get secret/myapp

# Read specific field
vault kv get -field=db_password secret/myapp
```

### Use in Application (Node.js)
```javascript
const vault = require('node-vault')({ endpoint: 'http://127.0.0.1:8200', token: process.env.VAULT_TOKEN });

const { data } = await vault.read('secret/data/myapp');
const dbPassword = data.data.db_password;
```

### Kubernetes Integration
```yaml
# Inject secrets as environment variables via Vault Agent
annotations:
  vault.hashicorp.com/agent-inject: "true"
  vault.hashicorp.com/role: "my-app"
  vault.hashicorp.com/agent-inject-secret-db: "secret/data/myapp"
```

## Features it supports
- Static secret storage (KV store)
- Dynamic secrets (auto-generated DB credentials, AWS IAM keys)
- Encryption as a service (encrypt/decrypt data without storing it)
- PKI certificate management
- Access policies and RBAC
- Audit logging (every secret access is logged)
- Auto-unsealing with cloud KMS
