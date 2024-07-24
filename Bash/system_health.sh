#!/bin/bash

# Variables
WEBHOOK_URL="https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
EMAIL="your_email@example.com"
THRESHOLD_CPU=80
THRESHOLD_MEM=80
THRESHOLD_DISK=80

# Function to check system health
check_health() {
    local USAGE=$1
    local THRESHOLD=$2
    local COMPONENT=$3
    if [ ${USAGE} -gt ${THRESHOLD} ]; then
        local MESSAGE="${COMPONENT} usage is at ${USAGE}% on $(hostname) at $(date)."
        echo ${MESSAGE} | mail -s "${COMPONENT} Usage Alert" ${EMAIL}
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" ${WEBHOOK_URL}
    fi
}

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
check_health ${CPU_USAGE} ${THRESHOLD_CPU} "CPU"

# Check memory usage
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
check_health ${MEM_USAGE} ${THRESHOLD_MEM} "Memory"

# Check disk usage
DISK_USAGE=$(df -h / | grep / | awk '{print $5}' | sed 's/%//g')
check_health ${DISK_USAGE} ${THRESHOLD_DISK} "Disk"