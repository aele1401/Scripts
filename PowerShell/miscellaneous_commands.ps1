# Check the Last Logon Time of a User:
Get-ADUser -Identity "jdoe" -Properties LastLogonDate | Select-Object Name, LastLogonDate

# Get All Active Directory Users and Display Name, Title, and Department:
Get-ADUser -Filter * -Property DisplayName, Title, Department | Select-Object DisplayName, Title, Department

# Find Inactive Computers in the Domain:
Search-ADAccount -ComputersOnly -AccountInactive -TimeSpan 90.00:00:00 | Select-Object Name, LastLogonDate

