# 🚨 Log Monitor & Brute-Force Detector

A Python-based security tool that monitors authentication logs in real-time and alerts you to potential brute-force attacks.

## 🏗️ Architecture
1. **Log Tailing**: Monitors system logs (e.g., `/var/log/auth.log` or a custom log file).
2. **Regex Parsing**: Extracts timestamps, IP addresses, and failure types.
3. **Threshold Logic**: Keeps track of failed attempts per IP within a time window (e.g., 5 failures in 60 seconds).
4. **Alerting**: Prints a warning to the console or triggers a notification.

## 🛠️ Stack
- **Language**: Python
- **Libraries**: `regex`, `watchdog` (optional for filesystem events).

## 🚀 Getting Started
1. Run the script:
   ```bash
   python monitor.py --log /path/to/auth.log --threshold 5
   ```

## 🧪 Key Features
- **Real-time Monitoring**: Detects attacks as they happen.
- **Customizable Rules**: Set thresholds for different severity levels.
- **IP Blacklisting**: Can be extended to automatically update firewall rules (iptables/ufw).
