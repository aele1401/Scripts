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