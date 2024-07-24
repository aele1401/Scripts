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