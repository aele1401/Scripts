#!/bin/bash

# Variables
ANSIBLE_PLAYBOOK="/path/to/ansible/playbook.yml"
INVENTORY_FILE="/path/to/ansible/inventory"

# Run Ansible playbook
ansible-playbook -i ${INVENTORY_FILE} ${ANSIBLE_PLAYBOOK}