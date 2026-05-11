# 04. Networking Essentials

A SysAdmin must understand how data moves between machines. This knowledge is vital for troubleshooting connectivity issues and securing the environment.

## 🌐 The TCP/IP Model

-   **Application**: HTTP, SSH, FTP, DNS.
-   **Transport**: TCP (reliable) vs. UDP (fast).
-   **Internet**: IP (addressing and routing).
-   **Network Access**: Physical cables, Wi-Fi, Ethernet.

## 📍 IP Addressing

-   **IPv4**: `192.168.1.1` (32-bit). Still most common.
-   **IPv6**: `2001:0db8:85a3:0000:0000:8a2e:0370:7334` (128-bit).
-   **Subnetting**: Dividing a network into smaller pieces.
-   **DHCP**: Automatically assigns IP addresses to devices on a network.

## 🔍 DNS (Domain Name System)

DNS translates human-readable names (`google.com`) into IP addresses (`8.8.8.8`).
-   **A Record**: Maps a name to an IPv4 address.
-   **CNAME**: Alias for another name.
-   **MX Record**: Specifies mail servers.
-   **NS Record**: Specifies authoritative name servers.

## 🛠️ Troubleshooting Tools

| Tool | Usage |
| :--- | :--- |
| `ping [host]` | Check if a host is reachable |
| `traceroute [host]` | Trace the path packets take to reach a host |
| `ip addr` / `ifconfig` | View network interface configurations |
| `netstat -tulpn` | See which ports are listening for connections |
| `dig [domain]` | Perform DNS lookups |
| `curl -I [url]` | Check HTTP headers and connectivity |

## 🛡️ Basic Security

-   **Firewalls**: Blocking unauthorized traffic. (e.g., `ufw allow 80/tcp`).
-   **NAT (Network Address Translation)**: Allowing multiple devices to share one public IP.
-   **VPN (Virtual Private Network)**: Creating a secure tunnel over a public network.

---

> [!TIP]
> If you can't reach a server, follow the layers: Is it physically connected? Does it have an IP? Is DNS resolving? Is the port open in the firewall? Is the service actually running?
