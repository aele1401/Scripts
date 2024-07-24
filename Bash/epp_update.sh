#!/bin/bash

# Variables
ENDPOINT_API_URL="https://endpoint.example.com/api/update"
API_KEY="your_api_key_here"
UPDATE_SETTINGS='{"setting1": "value1", "setting2": "value2"}'

# Update endpoint protection settings
curl -X POST -H "Authorization: Bearer ${API_KEY}" -H "Content-Type: application/json" \
-d "${UPDATE_SETTINGS}" ${ENDPOINT_API_URL}