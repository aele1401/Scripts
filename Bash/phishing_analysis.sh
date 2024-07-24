#!/bin/bash

# Variables
EMAIL_ANALYSIS_API_URL="https://emailanalysis.example.com/api/analyze"
API_KEY="your_api_key_here"
EMAIL_FILE="/path/to/phishing/email.eml"

# Analyze phishing email
curl -X POST -H "Authorization: Bearer ${API_KEY}" -F "file=@${EMAIL_FILE}" ${EMAIL_ANALYSIS_API_URL}