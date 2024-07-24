#!/bin/bash

# Variables
WEBHOOK_URL="https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
EMAIL="your_email@example.com"
THRESHOLD=80

# Check disk space usage
DISK_USAGE=$(df -h / | grep / | awk '{print $5}' | sed 's/%//g')

# Send alert if threshold is exceeded
if [ ${DISK_USAGE} -gt ${THRESHOLD} ]; then
    MESSAGE="Disk usage is at ${DISK_USAGE}% on $(hostname) at $(date)."
    echo ${MESSAGE} | mail -s "Disk Usage Alert" ${EMAIL}
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" ${WEBHOOK_URL}
fi