# Add a new firewall rule
New-NetFirewallRule -DisplayName "Allow SSH" -Direction Inbound -Protocol TCP -LocalPort 22 -Action Allow

# Remove a firewall rule
Remove-NetFirewallRule -DisplayName "Allow SSH"
