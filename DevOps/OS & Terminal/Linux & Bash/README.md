# Linux & Bash Scripting

## Description
Linux is the backbone of DevOps. Most servers, containers, and cloud environments run on Linux. Bash (Bourne Again SHell) is the standard command language used to automate tasks in Linux.

## Essential Linux Commands
```bash
ls -la          # List files (including hidden)
pwd             # Print working directory
cd /path        # Change directory
mkdir -p dir    # Create directory (and parents)
rm -rf dir      # Force remove directory
cp -r src dest  # Copy directory
mv src dest     # Move/Rename
touch file      # Create empty file
cat file        # View file content
grep "pattern"  # Search for text
find . -name "" # Find files
chmod 755 file  # Change permissions
chown user:group # Change ownership
top / htop      # Monitor processes
df -h           # Disk usage
```

## How to code it (Bash Script)
```bash
#!/bin/bash

# Variables
NAME="DevOps"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "Starting backup for $NAME at $TIMESTAMP"

# Conditionals
if [ -d "./data" ]; then
    tar -czf backup_$TIMESTAMP.tar.gz ./data
    echo "Backup successful"
else
    echo "Error: Data directory not found"
    exit 1
fi

# Loops
for file in *.log; do
    echo "Processing $file"
done
```

## Key OS Concepts to Learn
- Process Management (Systemd)
- File Systems & Permissions
- Users & Groups
- Package Management (apt, yum, pacman)
- Shell Scripting (Bash, Zsh)
- Text Processing (awk, sed)
