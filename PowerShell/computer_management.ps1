# Restart a Remote Computer:
Restart-Computer -ComputerName "ComputerName" -Force

# Check the Last Logon Time of a Computer:
Get-ADComputer -Identity "ComputerName" -Properties LastLogonDate | Select-Object Name, LastLogonDate

# Add a Computer to a Domain:
Add-Computer -DomainName "domain.com" -Credential (Get-Credential) -Restart

# Rename a Computer:
Rename-Computer -NewName "NewComputerName" -Force -Restart

# Check All Online Computers:
Get-ADComputer -Filter * | ForEach-Object { Test-Connection -ComputerName $_.Name -Count 1 -Quiet }

