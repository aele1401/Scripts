# Ruby
## Description
A collection of Ruby scripts used to automate penetration testing processes and streamline processes using various tools and integrations.

RestClient GEM may need to be installed to interact with REST APIs.

### Nmap Scans
- Script uses the nmap gem to automate network scanning and save the results to a file.
- Integration: Nmap
- Script: [nmap_scanning](https://github.com/aele1401/Scripts/blob/main/Ruby/nmap_scanning.rb)

### Metasploit Exploits
- Uses the msfrpc-client gem to interact with Metasploit and automate exploitation tasks.
- Integration: Metasploit
- Script: [metasploit_exploits](https://github.com/aele1401/Scripts/blob/main/Ruby/metasploit_exploits.rb)

### Nikto Scans
- Script uses the open3 library to run Nikto scans and capture the output.
- Integration: Nikto
- Script: [nikto_scanning](https://github.com/aele1401/Scripts/blob/main/Ruby/nikto_scanning.rb)

### OWASP ZAP for Automated Scanning
- Uses owasp_zap gem to automate OWASP ZAP scans.
- Integration: OWASP ZAP
- Script: [owasp_zap](https://github.com/aele1401/Scripts/blob/main/Ruby/owasp_zap.rb)

### Nessus Scanning
- This script uses the nessus_rest gem to interact with the Nessus API and automate scans.
- Integration: Tenable Nessus
- Script: [nessus](https://github.com/aele1401/Scripts/blob/main/Ruby/nessus.rb)

### Burp Suite
- Automates scan target, exporting, and analyzing results.
- Integration: Burp Suite
- Script: [burp_suite](https://github.com/aele1401/Scripts/blob/main/Ruby/burp_suite.rb)
