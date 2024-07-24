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