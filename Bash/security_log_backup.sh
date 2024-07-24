#!/bin/bash

# Variables
LOG_DIR="/var/log/security"
BACKUP_SERVER="backup.example.com"
REMOTE_DIR="/backups/security"
USER="your_user"

# Create a tarball of the logs
tar -czf /tmp/security_logs_$(date +%F).tar.gz ${LOG_DIR}

# Copy the tarball to the remote server
scp /tmp/security_logs_$(date +%F).tar.gz ${USER}@${BACKUP_SERVER}:${REMOTE_DIR}

# Clean up local tarball
rm /tmp/security_logs_$(date +%F).tar.gz