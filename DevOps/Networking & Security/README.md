# Networking & Security Fundamentals

## Description
A DevOps engineer must understand how data moves across networks and how to secure those connections.

## Key Protocols
- **HTTP/HTTPS**: The foundation of data exchange on the web.
- **SSH (Secure Shell)**: Encrypted protocol for operating network services securely over an unsecured network.
- **DNS (Domain Name System)**: Translates human-readable domain names to IP addresses.
- **SSL/TLS**: Protocols for establishing authenticated and encrypted links between networked computers.
- **FTP/SFTP**: File transfer protocols.

## Essential Commands
```bash
# Network Troubleshooting
ping google.com       # Check connectivity
dig google.com        # DNS lookup
curl -I google.com    # View HTTP headers
nslookup google.com   # Query DNS servers
netstat -tulpn        # View open ports/connections
ip addr show          # View IP addresses

# SSH
ssh user@host         # Login
ssh-keygen -t rsa     # Generate key pair
ssh-copy-id user@host # Copy public key to server

# Security
openssl req -new -x509 -days 365 # Generate self-signed SSL certificate
```

## Security Concepts
- **Firewalls**: (UFW, iptables) Controlling incoming/outgoing traffic.
- **Reverse Proxies**: (Nginx, Traefik) Masking backend servers.
- **Identity & Access Management (IAM)**: Managing permissions.
- **Secret Management**: (Vault) Protecting sensitive data.
- **VPN/VPC**: Isolated networking in the cloud.
