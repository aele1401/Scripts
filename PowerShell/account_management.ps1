# Enable user account
Enable-ADAccount -Identity "username"

# Disable user account
Disable-ADAccount -Identity "username"

# Create a new user
New-ADUser -Name "John Doe" -GivenName "John" -Surname "Doe" -SamAccountName "jdoe" -UserPrincipalName "jdoe@domain.com" -Path "OU=Users,DC=domain,DC=com" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) -Enabled $true

# Reset users' passwords
Set-ADAccountPassword -Identity "jdoe" -Reset -NewPassword (ConvertTo-SecureString "NewP@ssword1" -AsPlainText -Force)

# Unlock a locked out user
Unlock-ADAccount -Identity "jdoe"

# Force a User to Change Password at Next Logon
Set-ADUser -Identity "jdoe" -ChangePasswordAtLogon $true

# View User Account Details
Get-ADUser -Identity "jdoe" -Properties *

