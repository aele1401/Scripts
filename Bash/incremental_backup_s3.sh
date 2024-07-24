#!/bin/bash

# Variables
SOURCE_DIR="/path/to/source"
BUCKET_NAME="your-s3-bucket-name"
AWS_PROFILE="your-aws-profile"

# Perform incremental backup using rsync
rsync -av --delete ${SOURCE_DIR} /tmp/backup

# Sync the backup to AWS S3
aws s3 sync /tmp/backup s3://${BUCKET_NAME}/backup --profile ${AWS_PROFILE}

# Clean up local backup
rm -rf /tmp/backup
```
## System Health Monitoring and Alerting
- Description: A script to monitor system health (CPU, memory, disk usage) and send alerts via Slack or email if thresholds are exceeded.