# List All Users in a Specific OU:
Get-ADUser -Filter * -SearchBase "OU=Users,DC=domain,DC=com" | Select-Object Name

# Find Users Who Haven't Logged In for 30+ Days:
Search-ADAccount -UsersOnly -AccountInactive -TimeSpan 30.00:00:00 | Select-Object Name, LastLogonDate

# Find Users Created in the Last 7 Days:
Get-ADUser -Filter {WhenCreated -gt (Get-Date).AddDays(-7)} | Select-Object Name, WhenCreated



