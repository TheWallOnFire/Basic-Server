# Ansible

## Description
Ansible is an open-source IT automation tool by Red Hat. It automates software provisioning, configuration management, and application deployment using simple, human-readable YAML files called Playbooks.

## How it works
Ansible is **agentless** — it connects to remote machines over SSH (or WinRM for Windows) and executes tasks. Unlike Terraform (which provisions infrastructure), Ansible excels at **configuring** the software and services running on that infrastructure. No agent installation needed on target machines.

## How to code it
```yaml
# playbook.yml — Install and start Nginx on all web servers
---
- name: Configure Web Servers
  hosts: webservers
  become: yes

  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes

    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Start Nginx
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Deploy application config
      template:
        src: templates/app.conf.j2
        dest: /etc/nginx/sites-available/app.conf
      notify: Restart Nginx

  handlers:
    - name: Restart Nginx
      service:
        name: nginx
        state: restarted
```

### Inventory File
```ini
# inventory.ini
[webservers]
web1.example.com
web2.example.com

[databases]
db1.example.com
```

### Essential Commands
```bash
ansible-playbook playbook.yml -i inventory.ini
ansible all -m ping -i inventory.ini       # Test connectivity
ansible webservers -a "uptime"             # Run ad-hoc command
```

## Features it supports
- Agentless architecture (SSH-based)
- Idempotent operations (safe to run multiple times)
- 3000+ built-in modules
- Jinja2 templating for dynamic configuration
- Ansible Vault for encrypting secrets
- Roles and Galaxy (reusable, shareable automation packages)

## Real projects about it
- **NASA**: Uses Ansible to manage their cloud infrastructure.
- **Red Hat (IBM)**: Core product for enterprise automation.
- **Atlassian**: Uses Ansible to configure their infrastructure.
