# PowerShell
## Description
A collection of PowerShell scripts for automating security operations, automating tasks such as monitoring, incident response, system management, application packaging, and software deployments.

### User Account Management
- Description: Manages user accounts in Active Directory, including enabling, disabling, and creating accounts.
- Integration: Active Directory
- File: [account_management](https://github.com/aele1401/Scripts/blob/main/PowerShell/account_management.ps1)

### Failed Logins 
- Description: Filters failed RDP events from Windows Event Viewer.
- Integration: Windows Event Viewer
- File: [failed_logins_script](https://github.com/aele1401/Scripts/blob/main/PowerShell/failed_logins_script.ps1)

### Log Collection
- Description: Collects security logs from multiple servers and aggregates them into a central location.
- Integration: Windows Event Logs & File System.
- File: [log_collection](https://github.com/aele1401/Scripts/blob/main/PowerShell/log_collection.ps1)

### Security Patch Deployment
- Description: Deploys security patches to a list of servers.
- Integration: Windows Update
- File: [patch_deployment](https://github.com/aele1401/Scripts/blob/main/PowerShell/patch_deployment.ps1)

### Firewall Rule Management
- Description: Manages firewall rules by adding or removing rules based on predefined policies.
- Integration: Windows Firewall
- File: [firewall_rule_management](https://github.com/aele1401/Scripts/blob/main/PowerShell/firewall_rule_management.ps1)

### Security Alert Handling
- Description: Integrates with a SIEM system to handle security alerts by automatically generating tickets or notifications.
- Integration: Splunk
- File: [alert_handling](https://github.com/aele1401/Scripts/blob/main/PowerShell/alert_handling.ps1)

### Vulnerability Scanning
- Description: Initiates a vulnerability scan and retrieves the results.
- Integration: Nessus
- File: [vulnerability_scanning](https://github.com/aele1401/Scripts/blob/main/PowerShell/vulnerability_scanning.ps1)

### Incident Response Notification
- Description: Sends notifications to security teams or stakeholders when a critical incident is detected.
- Integration: Slack, Teams, Email
- File: [incident_response_notification](https://github.com/aele1401/Scripts/blob/main/PowerShell/incident_response_notification.ps1)

### SSH Key Management
- Description: Manages SSH keys for servers, including key generation and deployment.
- Integration: SSH Servers
- File: [ssh_key_management](https://github.com/aele1401/Scripts/blob/main/PowerShell/ssh_key_management.ps1)

### Application Packaging
- Script to Package an Application into a MSI File.
- Script to create a zip archive of an app.
- Files:
    * [package_msi](https://github.com/aele1401/Scripts/blob/main/PowerShell/package_msi.ps1)
    * [archive_app](https://github.com/aele1401/Scripts/blob/main/PowerShell/archive_app.ps1)

### Software Deployment & Automated Install
- Automated install script.
- Script to deploy software via SCCM.
- Script to deploy software via Group Policy
- Files:
    * [automated_install](https://github.com/aele1401/Scripts/blob/main/PowerShell/automated_install.ps1)
    * [deploy_sccm](https://github.com/aele1401/Scripts/blob/main/PowerShell/deploy_sccm.ps1)
    * [deploy_gpo](https://github.com/aele1401/Scripts/blob/main/PowerShell/deploy_gpo.ps1)


