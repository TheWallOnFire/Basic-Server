# systemd (Service Management)

## Description
`systemd` is the standard init system and service manager for Linux. It is responsible for starting and managing services (daemons) during the boot process and while the system is running.

## Essential Commands (systemctl)
```bash
# Managing Services
systemctl start nginx    # Start a service
systemctl stop nginx     # Stop a service
systemctl restart nginx  # Restart a service
systemctl status nginx   # Check service status
systemctl enable nginx   # Start service automatically on boot
systemctl disable nginx  # Disable auto-start on boot

# Managing the System
systemctl reboot         # Reboot the system
systemctl poweroff       # Shut down the system
```

## Viewing Logs (journalctl)
```bash
journalctl -u nginx      # View logs for a specific service
journalctl -f            # Follow logs in real-time
journalctl -p err        # View only error logs
journalctl --since "1 hour ago"
```

## How to code it (Unit File)
If you want to run your own application as a service, you create a `.service` file in `/etc/systemd/system/`.

```ini
[Unit]
Description=My Node.js App
After=network.target

[Service]
Type=simple
User=nodeuser
WorkingDirectory=/home/nodeuser/app
ExecStart=/usr/bin/node server.js
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
