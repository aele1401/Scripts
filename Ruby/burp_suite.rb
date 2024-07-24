require 'rest-client'
require 'json'

# Configuration
BURP_API_URL = 'http://localhost:1337/v0.1'
TARGET_URL = 'http://example.com'
API_KEY = 'your_api_key'  # Set your Burp Suite API key here

# Helper function to send requests to the Burp API
def send_request(endpoint, method: :get, payload: nil)
  url = "#{BURP_API_URL}/#{endpoint}"
  headers = { 'Content-Type': 'application/json', 'Authorization': "Bearer #{API_KEY}" }
  
  response = case method
             when :get
               RestClient.get(url, headers)
             when :post
               RestClient.post(url, payload.to_json, headers)
             when :delete
               RestClient.delete(url, headers)
             end
  JSON.parse(response.body)
rescue RestClient::ExceptionWithResponse => e
  puts "Error: #{e.response}"
  nil
end

# Start a new scan
def start_scan(target_url)
  payload = { url: target_url }
  response = send_request('scan', method: :post, payload: payload)
  response['scan_id']
end

# Check scan status
def scan_status(scan_id)
  response = send_request("scan/#{scan_id}/status")
  response['status']
end

# Get scan results
def get_scan_results(scan_id)
  response = send_request("scan/#{scan_id}/issues")
  response['issues']
end

# Export scan results
def export_scan_results(scan_id)
  response = send_request("scan/#{scan_id}/report", method: :post)
  report_id = response['report_id']
  
  # Fetch the report file
  report = send_request("report/#{report_id}/download")
  File.open("burp_scan_report_#{scan_id}.html", 'wb') { |file| file.write(report) }
end

# Start the scan
scan_id = start_scan(TARGET_URL)
puts "Started scan with ID: #{scan_id}"

# Polling scan status
status = scan_status(scan_id)
while status != 'completed'
  puts "Scan status: #{status}"
  sleep(10)
  status = scan_status(scan_id)
end

puts "Scan completed"

# Get and print scan results
issues = get_scan_results(scan_id)
issues.each do |issue|
  puts "Issue: #{issue['name']}"
  puts "Severity: #{issue['severity']}"
  puts "Confidence: #{issue['confidence']}"
  puts "URL: #{issue['url']}"
  puts "Issue Background: #{issue['issueBackground']}"
  puts "Remediation Background: #{issue['remediationBackground']}"
  puts "-----------------------------"
end

# Export the scan results to a file
export_scan_results(scan_id)
puts "Scan results exported to burp_scan_report_#{scan_id}.html"
