# Example of creating an alert in Splunk via REST API
$uri = "https://splunk-instance:8089/servicesNS/admin/search/search/jobs"
$headers = @{
    "Authorization" = "Bearer YOUR_SPLUNK_API_TOKEN"
}
$body = @{
    search = "search index=security_alerts | stats count by alert_type"
}
Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body $body
