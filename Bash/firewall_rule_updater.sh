#!/bin/bash

# Variables
FIREWALL_API_URL="https://firewall.example.com/api/rules"
API_KEY="your_api_key_here"
BLOCKED_IP="192.168.1.1"

# Update firewall rule
curl -X POST -H "Authorization: Bearer ${API_KEY}" -H "Content-Type: application/json" \
-d "{\"action\":\"block\",\"ip\":\"${BLOCKED_IP}\"}" ${FIREWALL_API_URL}