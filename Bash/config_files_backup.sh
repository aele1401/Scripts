#!/bin/bash

# Variables
CONFIG_DIR="/etc"
BACKUP_SERVER="backup.example.com"
REMOTE_DIR="/backups/config"
USER="your_user"

# Create a tarball of the configuration files
tar -czf /tmp/config_backup_$(date +%F).tar.gz ${CONFIG_DIR}

# Copy the tarball to the remote server
scp /tmp/config_backup_$(date +%F).tar.gz ${USER}@${BACKUP_SERVER}:${REMOTE_DIR}

# Clean up local tarball
rm /tmp/config_backup_$(date +%F).tar.gz