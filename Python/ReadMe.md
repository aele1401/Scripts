# Python
## Description
- These python scripts can serve as a foundation for automating various security operations and integrating different security tools and systems using REST APIs, thus enhancing the overall security posture.
### Automated Security Alert Triage
- Description: This script fetches security alerts from a SIEM system (like Splunk or IBM QRadar) and categorizes them based on severity. It can enrich alerts with additional data from threat intelligence platforms.
- Tools/APIs: Splunk REST API, IBM QRadar REST API, Threat Intelligence APIs (e.g., VirusTotal, AlienVault OTX).
```
import requests

def fetch_splunk_alerts(api_url, token):
    headers = {'Authorization': f'Bearer {token}'}
    response = requests.get(f'{api_url}/services/search/jobs', headers=headers)
    alerts = response.json()
    return alerts

def categorize_alerts(alerts):
    categorized = {'low': [], 'medium': [], 'high': []}
    for alert in alerts:
        severity = alert['severity']
        if severity == 'low':
            categorized['low'].append(alert)
        elif severity == 'medium':
            categorized['medium'].append(alert)
        else:
            categorized['high'].append(alert)
    return categorized

# Example usage
api_url = 'https://splunk-instance/api'
token = 'YOUR_SPLUNK_API_TOKEN'
alerts = fetch_splunk_alerts(api_url, token)
categorized_alerts = categorize_alerts(alerts)
print(categorized_alerts)
```

### Automated Incident Response
- Description: This script integrates with an incident response platform (like TheHive) and automatically assigns and tracks incidents, while updating their status based on predefined workflows.
Tools/APIs: TheHive REST API.
```
import requests

def create_incident(api_url, token, incident_data):
    headers = {'Authorization': f'Bearer {token}', 'Content-Type': 'application/json'}
    response = requests.post(f'{api_url}/api/case', headers=headers, json=incident_data)
    return response.json()

def update_incident_status(api_url, token, incident_id, status):
    headers = {'Authorization': f'Bearer {token}', 'Content-Type': 'application/json'}
    response = requests.patch(f'{api_url}/api/case/{incident_id}', headers=headers, json={'status': status})
    return response.json()

# Example usage
api_url = 'https://thehive-instance/api'
token = 'YOUR_THEHIVE_API_TOKEN'
incident_data = {'title': 'New Incident', 'description': 'Details of the incident'}
incident = create_incident(api_url, token, incident_data)
update_incident_status(api_url, token, incident['id'], 'InProgress')
```

### Automated Threat Intelligence Feeds Update
- Description: This script fetches the latest threat intelligence feeds from multiple sources and updates a central threat intelligence platform.
- Tools/APIs: Threat Intelligence APIs (e.g., VirusTotal, AlienVault OTX), MISP REST API.
```
import requests

def fetch_threat_intel(api_url, token):
    headers = {'Authorization': f'Bearer {token}'}
    response = requests.get(api_url, headers=headers)
    intel = response.json()
    return intel

def update_misp(api_url, token, intel_data):
    headers = {'Authorization': f'Bearer {token}', 'Content-Type': 'application/json'}
    response = requests.post(f'{api_url}/events', headers=headers, json=intel_data)
    return response.json()

# Example usage
virus_total_url = 'https://www.virustotal.com/api/v3/intel'
misp_url = 'https://misp-instance/api'
token = 'YOUR_API_TOKEN'
intel_data = fetch_threat_intel(virus_total_url, token)
update_misp(misp_url, token, intel_data)
```

###  Automated Vulnerability Scanning and Reporting
- Description: This script integrates with a vulnerability scanning tool (like Nessus or OpenVAS) to automatically run scans and generate reports.
- Tools/APIs: Nessus REST API, OpenVAS REST API.
```
import requests

def start_scan(api_url, token, scan_id):
    headers = {'X-Cookie': f'token={token}', 'Content-Type': 'application/json'}
    response = requests.post(f'{api_url}/scans/{scan_id}/launch', headers=headers)
    return response.json()

def get_scan_report(api_url, token, scan_id):
    headers = {'X-Cookie': f'token={token}'}
    response = requests.get(f'{api_url}/scans/{scan_id}/report', headers=headers)
    report = response.json()
    return report

# Example usage
api_url = 'https://nessus-instance/api'
token = 'YOUR_NESSUS_API_TOKEN'
scan_id = 1
start_scan(api_url, token, scan_id)
report = get_scan_report(api_url, token, scan_id)
print(report)
```

### Automated Firewall Rule Management
- Description: This script manages firewall rules by adding, updating, or removing rules based on predefined policies.
- Tools/APIs: Palo Alto Networks PAN-OS REST API, Cisco ASA REST API.
```
import requests

def add_firewall_rule(api_url, token, rule_data):
    headers = {'Authorization': f'Bearer {token}', 'Content-Type': 'application/json'}
    response = requests.post(f'{api_url}/api/v1/firewall/rules', headers=headers, json=rule_data)
    return response.json()

def delete_firewall_rule(api_url, token, rule_id):
    headers = {'Authorization': f'Bearer {token}'}
    response = requests.delete(f'{api_url}/api/v1/firewall/rules/{rule_id}', headers=headers)
    return response.json()

# Example usage
api_url = 'https://firewall-instance/api'
token = 'YOUR_FIREWALL_API_TOKEN'
rule_data = {'source': '0.0.0.0/0', 'destination': '0.0.0.0/0', 'action': 'allow'}
add_firewall_rule(api_url, token, rule_data)
delete_firewall_rule(api_url, token, 1)
```

### Automated User Account Management
- Description: This script automates the provisioning, updating, and deprovisioning of user accounts in Active Directory or other identity management systems.
- Tools/APIs: Active Directory REST API, Azure AD Graph API.
```
import requests

def create_user(api_url, token, user_data):
    headers = {'Authorization': f'Bearer {token}', 'Content-Type': 'application/json'}
    response = requests.post(f'{api_url}/users', headers=headers, json=user_data)
    return response.json()

def delete_user(api_url, token, user_id):
    headers = {'Authorization': f'Bearer {token}'}
    response = requests.delete(f'{api_url}/users/{user_id}', headers=headers)
    return response.json()

# Example usage
api_url = 'https://graph.microsoft.com/v1.0'
token = 'YOUR_AZURE_AD_API_TOKEN'
user_data = {'accountEnabled': True, 'displayName': 'John Doe', 'mailNickname': 'jdoe', 'userPrincipalName': 'jdoe@domain.com'}
create_user(api_url, token, user_data)
delete_user(api_url, token, 'user_id')
```

### Automated Log Data Analysis
- Description: This script fetches log data from Elasticsearch, identifies the most frequent error messages, and generates a summary report.
- Tools/APIs: Elasticsearch REST API.
```
import requests
import json
from collections import Counter

def fetch_logs(es_url, index, query, size, username, password):
    headers = {'Content-Type': 'application/json'}
    auth = (username, password)
    response = requests.get(f'{es_url}/{index}/_search', headers=headers, auth=auth, data=json.dumps(query))
    logs = response.json()
    return logs

def analyze_logs(logs):
    messages = [hit['_source']['message'] for hit in logs['hits']['hits']]
    error_messages = [msg for msg in messages if 'error' in msg.lower()]
    error_counts = Counter(error_messages)
    most_common_errors = error_counts.most_common(5)
    return most_common_errors

def generate_report(most_common_errors):
    report = "Log Analysis Report\n\nMost Common Errors:\n"
    for error, count in most_common_errors:
        report += f"{error}: {count} occurrences\n"
    return report

# Example usage
es_url = 'https://your-elasticsearch-instance'
index = 'logs-*'
query = {
    "query": {
        "match_all": {}
    },
    "size": 1000
}
username = 'your_username'
password = 'your_password'

logs = fetch_logs(es_url, index, query, 1000, username, password)
most_common_errors = analyze_logs(logs)
report = generate_report(most_common_errors)

print(report)
```
### Automated Penetration Testing
- Description: This script performs network scanning, vulnerability scanning, and SSH password brute-forcing.
- Tools/APIs: Nmap and Paramiko
- Install dependency: `pip install python-nmap requests paramiko`
- Script:
```
import nmap
import requests
import paramiko
from paramiko import SSHClient, AutoAddPolicy

def network_scan(target):
    nm = nmap.PortScanner()
    nm.scan(target, '1-1024')
    scan_data = nm.all_hosts()
    return scan_data

def vulnerability_scan(target):
    nm = nmap.PortScanner()
    args = '-sV --script=vuln'
    nm.scan(target, arguments=args)
    vuln_data = nm[target]['hostscript']
    return vuln_data

def ssh_brute_force(target, username, password_list):
    ssh = SSHClient()
    ssh.set_missing_host_key_policy(AutoAddPolicy())
    for password in password_list:
        try:
            ssh.connect(target, username=username, password=password)
            return password
        except paramiko.AuthenticationException:
            continue
    return None

def report_scan_results(scan_data, vuln_data, ssh_password):
    report = "Penetration Testing Report\n\nNetwork Scan Results:\n"
    for host in scan_data:
        report += f"Host: {host}\n"
        for proto in nm[host].all_protocols():
            lport = nm[host][proto].keys()
            for port in lport:
                report += f"Port: {port}, State: {nm[host][proto][port]['state']}\n"

    report += "\nVulnerability Scan Results:\n"
    for item in vuln_data:
        report += f"ID: {item['id']}, Description: {item['output']}\n"

    if ssh_password:
        report += f"\nSSH Brute Force Result:\nPassword found: {ssh_password}\n"
    else:
        report += "\nSSH Brute Force Result:\nPassword not found\n"

    return report

# Example usage
target = '192.168.1.1'
username = 'root'
password_list = ['password123', 'admin', 'root', 'toor']

scan_data = network_scan(target)
vuln_data = vulnerability_scan(target)
ssh_password = ssh_brute_force(target, username, password_list)
report = report_scan_results(scan_data, vuln_data, ssh_password)

print(report)
```

