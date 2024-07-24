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