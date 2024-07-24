require 'nmap/program'
require 'nmap/xml'

output_file = 'nmap_scan.xml'
targets = '192.168.1.0/24'

Nmap::Program.scan do |nmap|
  nmap.targets = targets
  nmap.service_scan = true
  nmap.os_fingerprint = true
  nmap.xml = output_file
end

Nmap::XML.new(output_file) do |xml|
  xml.each_host do |host|
    puts "Host: #{host.ip} (#{host.hostname})"
    host.each_port do |port|
      puts "  Port: #{port.number}/#{port.protocol} (#{port.service}) - #{port.state}"
    end
  end
end
