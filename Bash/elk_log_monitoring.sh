#!/bin/bash

# Variables
LOG_FILE="/var/log/syslog"
ELK_URL="http://elk.example.com:9200/logs/_doc"

# Function to send log entries to ELK
send_to_elk() {
    local LOG_ENTRY=$1
    curl -X POST "${ELK_URL}" -H 'Content-Type: application/json' -d "{\"message\":\"${LOG_ENTRY}\"}"
}

# Monitor log file and send critical entries to ELK
tail -F ${LOG_FILE} | while read LOG_ENTRY; do
    if echo ${LOG_ENTRY} | grep -q "CRITICAL"; then
        send_to_elk "${LOG_ENTRY}"
    fi
done