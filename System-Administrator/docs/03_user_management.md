# 03. User & Group Management

Managing access is a critical part of a SysAdmin's job. This involves creating users, assigning them to groups, and ensuring they have the right level of access—no more, no less.

## 👤 User Management

-   `useradd -m [username]`: Create a new user with a home directory.
-   `passwd [username]`: Set or change a user's password.
-   `userdel -r [username]`: Delete a user and their home directory.
-   `id [username]`: Display user and group IDs.

## 👥 Group Management

Groups allow you to apply permissions to multiple users at once.

-   `groupadd [groupname]`: Create a new group.
-   `usermod -aG [groupname] [username]`: Add a user to a group (the `-a` is important to append, not replace).
-   `groups [username]`: List all groups a user belongs to.

## 🔑 Sudo and Root

The **root** user is the superuser with complete control over the system. For security, you should rarely log in as root. Instead, use **sudo** (superuser do).

### The `/etc/sudoers` File
This file controls who can run commands with root privileges. 
> [!CAUTION]
> Always use `visudo` to edit this file. It checks for syntax errors before saving, preventing you from locking yourself out of root access.

## 🔒 Best Practices

1.  **Principle of Least Privilege**: Give users only the permissions they need to do their job.
2.  **SSH Key Authentication**: Disable password login for SSH and use public/private keys instead.
3.  **Regular Audits**: Periodically check `/etc/passwd` and `/etc/group` for unauthorized accounts.
4.  **Force Password Changes**: Use `chage` to set password expiration policies.

---

> [!NOTE]
> Modern systems often use centralized identity management like **Active Directory (AD)** or **LDAP**, but the local user concepts still apply to the servers themselves.
