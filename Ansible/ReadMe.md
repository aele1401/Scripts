# Ansible
## Description
Collection of Ansible scripts used to automate configuration of systems, manual tasks, and deployments.

### ELK Stack Configuration & Automation w/ Ansible
#### Description
- Automates configuration of an ELK machine. Playbooks implement the following tasks:
    * Installs docker images (docker.io), python module (python3-pip), and enables docker service
    * Increases system memory with sysctl module
    * Downloads and launches docker containers (web & elk)
    * Installs, sets up, and enables filebeat & metricbeat

#### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

- Copy the configuration (preconfigured) files to your ansible playbook.
    * Copy [web.yml](https://github.com/aele1401/Scripts/blob/main/Ansible/ELK/web.yml) and [elk.yml](https://github.com/aele1401/Scripts/blob/main/Ansible/ELK/elk.yml) files into your Ansible container.
- Attach Ansible docker container.
- Update Ansible configuration file with ELK IP.
- Run playbook and navigate to Kibana site to verify installation is working.
- To use Filebeat:
    * Edit `filebeat-config.yml` file in Ansible container on control node to include ELK IP.
    * Run playbook file
- To use Metricbeat:
    * Edit `metricbeat-config.yml` file in Ansible container on control node to include ELK IP.
    * Run playbook file

### Patching Vulnerable Servers (Linux & Windows)
- Description: Playbooks for patching vulnerable Windows and Linux servers.
#### Using the Playbook for Linux:
- Prepare inventory by creating an inventory file (`hosts`) to list servers.
```
[linux_servers]
server1 ansible_host=192.168.1.10 ansible_user=your_user
server2 ansible_host=192.168.1.11 ansible_user=your_user
```

#### Using the Playbook for Windows:
- Prepare inventory by creating an inventory file (`hosts`) to list servers.
```
[windows_servers]
server3 ansible_host=192.168.1.12 ansible_user=your_user ansible_password=your_password ansible_connection=winrm ansible_winrm_transport=basic ansible_winrm_server_cert_validation=ignore
server4 ansible_host=192.168.1.13 ansible_user=your_user ansible_password=your_password ansible_connection=winrm ansible_winrm_transport=basic ansible_winrm_server_cert_validation=ignore
```

- Run playbook using: `ansible-playbook -i hosts patch_servers.yml`

### Patching Vulnerable WordPress Application
- Description: Ansible playbook for patching vulnerable WordPress application. Playbook implements:
    * Backing up the current WordPress installation.
    * Downloading the latest WordPress version.
    * Updating the WordPress core files.
    * Updating plugins and themes.
    * Running any necessary database updates.




