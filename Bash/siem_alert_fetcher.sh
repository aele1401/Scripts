#!/bin/bash

# Variables
SIEM_API_URL="https://siem.example.com/api/alerts"
API_KEY="your_api_key_here"

# Fetch alerts
curl -X GET -H "Authorization: Bearer ${API_KEY}" ${SIEM_API_URL}