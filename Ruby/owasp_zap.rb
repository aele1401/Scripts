require 'owasp_zap'

zap = OwaspZap::Zap.new(target: 'http://example.com')

# Start a new scan
scan_id = zap.spider.scan

puts "Scan started with ID #{scan_id}"

# Poll the status of the scan
while zap.spider.status(scan_id) != '100'
  puts "Scan progress: #{zap.spider.status(scan_id)}%"
  sleep(5)
end

puts "Scan completed"

# Fetch and print the results
results = zap.core.alerts(baseurl: 'http://example.com')
results.each do |alert|
  puts "Alert: #{alert['alert']}"
  puts "Risk: #{alert['risk']}"
  puts "Description: #{alert['description']}"
end
