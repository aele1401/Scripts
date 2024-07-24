$servers = @("Server1", "Server2", "Server3")

foreach ($server in $servers) {
    Invoke-Command -ComputerName $server -ScriptBlock {
        Install-WindowsUpdate -AcceptAll -AutoReboot
    }
}
