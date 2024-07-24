#!/bin/bash

# Variables
SOURCE_DIR="/path/to/source"
REMOTE_SERVER="remote.example.com"
REMOTE_DIR="/path/to/remote/backup"
USER="your_user"

# Perform rsync backup
rsync -avz ${SOURCE_DIR} ${USER}@${REMOTE_SERVER}:${REMOTE_DIR}