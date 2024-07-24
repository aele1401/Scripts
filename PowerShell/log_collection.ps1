$servers = @("Server1", "Server2", "Server3")
$destinationFolder = "\\CentralServer\Logs"

foreach ($server in $servers) {
    $logFile = "$destinationFolder\$server-Logs.evtx"
    Get-WinEvent -ComputerName $server -LogName Security | Export-Clixml -Path $logFile
}