# 02. Linux Fundamentals

Linux is the backbone of the internet. Most servers run some distribution (distro) of Linux. Understanding how it works is non-negotiable for a SysAdmin.

## 📁 The Filesystem Hierarchy (FHS)

Everything in Linux is a file. The structure starts at the root `/`:

-   `/bin` & `/sbin`: Essential binary executables.
-   `/etc`: System-wide configuration files (where you'll spend a lot of time).
-   `/home`: User home directories.
-   `/root`: The home directory for the root user.
-   `/var`: Variable data, like logs (`/var/log`) and databases.
-   `/tmp`: Temporary files (often cleared on reboot).
-   `/dev`: Device files (representing hardware).

## ⌨️ Essential Commands

| Command | Description |
| :--- | :--- |
| `ls -la` | List all files with detailed info |
| `cd [path]` | Change directory |
| `pwd` | Print working directory |
| `cp -r` | Copy files or directories recursively |
| `mv` | Move or rename files |
| `rm -rf` | Remove files or directories (be careful!) |
| `grep` | Search text using patterns |
| `find` | Search for files in the directory tree |
| `top` / `htop` | Monitor system resources and processes |

## 🛡️ Permissions

Every file has three types of permissions: **Read (4)**, **Write (2)**, and **Execute (1)**.
They are assigned to three categories: **Owner**, **Group**, and **Others**.

Example: `chmod 755 script.sh`
-   7 (4+2+1): Owner can Read, Write, Execute.
-   5 (4+1): Group can Read, Execute.
-   5 (4+1): Others can Read, Execute.

## 📦 Package Management

Depending on your distro, you'll use different tools:
-   **Debian/Ubuntu**: `apt update`, `apt install [package]`
-   **CentOS/RHEL**: `yum install` or `dnf install`
-   **Arch**: `pacman -S`

---

> [!IMPORTANT]
> Never run `rm -rf /` or similar commands without double-checking. Use `ls` first to see what you are about to delete.
