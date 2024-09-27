# Move a User to a Different OU:
Move-ADObject -Identity "CN=John Doe,OU=OldOU,DC=domain,DC=com" -TargetPath "OU=NewOU,DC=domain,DC=com"

# Find All Disabled User Accounts:
Get-ADUser -Filter {Enabled -eq $false} | Select-Object Name, Enabled

# Delete a User:
Remove-ADUser -Identity "jdoe"

