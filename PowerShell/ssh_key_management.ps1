# Generate a new SSH key
ssh-keygen -t rsa -b 2048 -f "C:\path\to\id_rsa" -N ""

# Copy SSH key to server
$server = "server.domain.com"
$sshKey = Get-Content -Path "C:\path\to\id_rsa.pub"
Invoke-Command -ComputerName $server -ScriptBlock {
    param ($key)
    Add-Content -Path "~/.ssh/authorized_keys" -Value $key
} -ArgumentList $sshKey
