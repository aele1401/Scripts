require 'open3'

target = 'http://example.com'
output_file = 'nikto_scan.txt'

command = "nikto -h #{target} -o #{output_file}"

Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
  puts "Nikto scan started for #{target}"
  puts stdout.read
  puts stderr.read
end

puts "Nikto scan completed. Results saved to #{output_file}"
