#!/bin/bash

# Variables
WEBHOOK_URL="https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
EMAIL="your_email@example.com"

# Update package lists
sudo apt-get update

# Perform package updates
sudo apt-get upgrade -y

# Check if the update was successful
if [ $? -eq 0 ]; then
    MESSAGE="Package update completed successfully on $(hostname) at $(date)."
else
    MESSAGE="Package update failed on $(hostname) at $(date). Please check the logs."
fi

# Send notification via Slack
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" ${WEBHOOK_URL}

# Send notification via email
echo ${MESSAGE} | mail -s "Package Update Notification" ${EMAIL}