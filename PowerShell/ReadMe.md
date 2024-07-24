# PowerShell
A collection of PowerShell scripts for automating security operations, automating tasks such as monitoring, incident response, system management, application packaging, and software deployments.

### User Account Management
- Description: Manages user accounts in Active Directory, including enabling, disabling, and creating accounts.
- Integration: Active Directory

### Failed Logins 
- Description: Filters failed RDP events from Windows Event Viewer.
- Integration: Windows Event Viewer

### Log Collection
- Description: Collects security logs from multiple servers and aggregates them into a central location.
- Integration: Windows Event Logs & File System.

### Security Patch Deployment
- Description: Deploys security patches to a list of servers.
- Integration: Windows Update

### Firewall Rule Management
- Description: Manages firewall rules by adding or removing rules based on predefined policies.
- Integration: Windows Firewall

### Security Alert Handling
- Description: Integrates with a SIEM system to handle security alerts by automatically generating tickets or notifications.
- Integration: Splunk

### Vulnerability Scanning
- Description: Initiates a vulnerability scan and retrieves the results.
- Integration: Nessus

### Incident Response Notification
- Description: Sends notifications to security teams or stakeholders when a critical incident is detected.
- Integration: Slack, Teams, Email

### SSH Key Management
- Description: Manages SSH keys for servers, including key generation and deployment.
- Integration: SSH Servers

### Application Packaging
- Script to Package an Application into a MSI File.
- Script to create a zip archive of an app.

### Software Deployment & Automated Install
- Automated install script.
- Script to deploy software via SCCM.
- Script to deploy software via Group Policy

