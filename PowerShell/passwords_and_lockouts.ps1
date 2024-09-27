# Find Locked Out Users:
Search-ADAccount -LockedOut | Select-Object Name, LockedOut

# Find Users with Passwords Expired:
Search-ADAccount -PasswordExpired | Select-Object Name, PasswordExpired

# Check a User's Password Expiry Date:
Get-ADUser -Identity "jdoe" -Properties "msDS-UserPasswordExpiryTimeComputed" | Select-Object Name,@{Name="PasswordExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}


