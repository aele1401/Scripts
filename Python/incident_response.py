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