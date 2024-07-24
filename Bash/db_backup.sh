#!/bin/bash

# Variables
DB_NAME="your_database"
DB_USER="your_db_user"
DB_PASS="your_db_password"
BUCKET_NAME="your-s3-bucket-name"
AWS_PROFILE="your-aws-profile"
BACKUP_FILE="/tmp/${DB_NAME}_$(date +%F).sql"

# Perform database backup
mysqldump -u ${DB_USER} -p${DB_PASS} ${DB_NAME} > ${BACKUP_FILE}

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup completed successfully."
    aws s3 cp ${BACKUP_FILE} s3://${BUCKET_NAME}/backup/ --profile ${AWS_PROFILE}
else
    echo "Database backup failed. Please check the logs."
fi

# Clean up local backup file
rm ${BACKUP_FILE}