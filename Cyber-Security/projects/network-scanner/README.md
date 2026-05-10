# 🔍 Network Scanner Project

A lightweight, high-performance network discovery tool built with Python and Scapy.

## 🏗️ Architecture
1. **Target Parsing**: Handles single IPs, ranges (192.168.1.1-50), or CIDR (192.168.1.0/24).
2. **ARP Discovery**: Sends ARP requests to find active hosts on the local network.
3. **Port Scanning**: Multi-threaded TCP/UDP port scanner to identify open services.
4. **Service Identification**: Attempts to grab banners to identify software versions.

## 🛠️ Stack
- **Language**: Python 3.9+
- **Core Library**: `scapy` (for packet manipulation).
- **Concurrency**: `threading` (for speed).

## 🚀 Getting Started
1. Install Scapy: `pip install scapy`.
2. Run with sudo/admin privileges:
   ```bash
   sudo python scanner.py --target 192.168.1.0/24
   ```

## 🧪 Key Features
- **Fast Discovery**: Scans a /24 network in seconds.
- **Port Ranges**: Scan common ports or custom ranges.
- **Output**: Clean table-formatted results.

> [!CAUTION]
> Only run this tool on networks you own or have explicit permission to test. Unauthorized scanning is illegal.
