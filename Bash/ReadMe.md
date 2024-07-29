# Bash

This is a collection of Bash scripts designed to automate updates, backups, system monitoring, and security operations.

### System Updates w/ Notification
- Description: A script to automate system updates and send notifications via Slack or email upon completion.
- File: [system_updates_notification](https://github.com/aele1401/Scripts/blob/main/Bash/system_updates_notification.sh)

### Incremental Backups with AWS S3
- Description: A script to perform incremental backups of specified directories to an AWS S3 bucket.
- File: [incremental_backup_s3](https://github.com/aele1401/Scripts/blob/main/Bash/incremental_backup_s3.sh)

### System Health Monitoring and Alerting
- Description: A script to monitor system health (CPU, memory, disk usage) and send alerts via Slack or email if thresholds are exceeded.
- File: [system_health](https://github.com/aele1401/Scripts/blob/main/Bash/system_health.sh)

### Database Backup and Monitoring with MySQL and AWS S3
- Description: A script to back up a MySQL database to AWS S3 and monitor the backup process.
- File: [db_backup](https://github.com/aele1401/Scripts/blob/main/Bash/db_backup.sh)

### Log Monitoring and Analysis with ELK
- Description: script to monitor system logs and send critical entries to an ELK (Elasticsearch, Logstash, Kibana) stack for analysis.
- File: [elk_log_monitoring]

### Automated Package Updates with Status Reporting
- Description: automates package updates and reports the status via Slack or email.
- File: [updates_status_reporting](https://github.com/aele1401/Scripts/blob/main/Bash/Updates_status_reporting.sh)

###  Automated Backup of Configuration Files
- Description: A script to back up important configuration files to a remote server using SCP.
- File: [config_files_backup](https://github.com/aele1401/Scripts/blob/main/Bash/config_files_backup.sh)

### Monitoring Disk Space and Sending Alerts
- Description: A script to monitor disk space usage and send alerts via Slack or email if it exceeds a specified threshold.
- File: [disk_space_monitor](https://github.com/aele1401/Scripts/blob/main/Bash/disk_space_monitor.sh)

### Automated Remote Backup with Rsync
- Description: A script to perform automated backups of directories to a remote server using rsync.
- File: [rsync_remote_backup](https://github.com/aele1401/Scripts/blob/main/Bash/rsync_remote_backup.sh)

### SIEM Alert Fetcher
- Description: A script to fetch alerts from a Security Information and Event Management (SIEM) system via its REST API.
- File: [siem_alert_fetcher](https://github.com/aele1401/Scripts/blob/main/Bash/siem_alert_fetcher.sh)

### Firewall Rule Update
- Description: A script to update firewall rules via its REST API, useful for blocking malicious IP addresses detected by security systems.
- File: [firewall_rule_updater](https://github.com/aele1401/Scripts/blob/main/Bash/firewall_rule_updater.sh)

###  Endpoint Protection Update
- Description: A script to update endpoint protection configurations via its REST API.
- File: [epp_update](https://github.com/aele1401/Scripts/blob/main/Bash/epp_update.sh)

### Phishing Email Analysis
- Description: A script to automate the analysis of phishing emails using a third-party email analysis service.
- File: [phishing_analysis](https://github.com/aele1401/Scripts/blob/main/Bash/phishing_analysis.sh)

###  Automated Backup of Security Logs
- Description: A script to automatically back up security logs to a remote server or cloud storage.
- File: [security_log_backup](https://github.com/aele1401/Scripts/blob/main/Bash/security_log_backup.sh)

### Automatic Patch Management w/ Ansible
- Description: A script to automatically apply security patches to servers using a configuration management tool like Ansible.
- File: [patch_management](https://github.com/aele1401/Scripts/blob/main/Bash/patch_management.sh)

### Automated Malware Analysis
- Description: A script to submit files to a malware analysis sandbox and retrieve the analysis results.
- File: [malware_analysis](https://github.com/aele1401/Scripts/blob/main/Bash/malware_analysis.sh)

### System & File Management
- Description: Script shows unallocated memory, disk use, open files, and free disk space.
- File: [system_management](https://github.com/aele1401/Scripts/blob/main/Bash/system_management.sh)

