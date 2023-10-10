# CONFIG_SERVER_BASE_INSTALL

## Description: 

This Ansible role automates the installation and configuration of a Linux server with basic requirements.


## Prerequisites

- [x] **Ansible Installed:** Ensure that Ansible is installed on your control machine where you'll run the playbook. You can install Ansible following the official [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/index.html).

-  [x] **SSH Access:** Make sure you have SSH access to the target server(s) where you want to install and configure the SMTP server.

## Os available:

- [x] Debian
- [x] RedHat

## Playbook Usage

1. **Create playbook.yml file and add the role name**:
  
   ```bash
    - hosts: servers
      roles:
         - config_server_base_install
   ```

2. **Create inventory.ini file**:

```bash
[smtp_servers]
your_target_server ansible_ssh_user=your_ssh_user ansible_ssh_host=server_ip_or_hostname
 ```

3. **Run the playbook by executing the fallowing command**:

 ```bash
 ansible-playbook -i inventory.ini playbook.yml

 ```

## Role Variables

- check the role variables in [here](./vars)


## Author

Mansour KA
