# Advanced SSH (Config & Tunneling)

## Description
SSH is more than just a remote login tool. It can be used for secure file transfers, port forwarding, and managing complex connections.

## SSH Config File (`~/.ssh/config`)
Instead of typing `ssh -i key.pem ubuntu@ec2-54-12-34-56.compute-1.amazonaws.com`, you can define a shortcut.
```text
Host prod-server
    HostName 54.12.34.56
    User ubuntu
    IdentityFile ~/keys/prod.pem
    Port 2222
```
Now you can just type: `ssh prod-server`

## SSH Tunneling (Port Forwarding)
### Local Port Forwarding
Access a database that is only available inside the remote server's network.
```bash
# Access remote DB (localhost:5432) via your local port 8888
ssh -L 8888:localhost:5432 user@remote-host
```

### Remote Port Forwarding
Expose your local development server to the internet via a remote public server.
```bash
# Forward remote port 8080 to your local port 3000
ssh -R 8080:localhost:3000 user@public-server
```

## Security Best Practices
- **Disable Password Auth**: Use SSH keys only.
- **Change Default Port**: Move from 22 to something else to avoid bot scans.
- **Use `fail2ban`**: Automatically block IPs with too many failed attempts.
- **Agent Forwarding**: Safely use your local keys on a remote server.
