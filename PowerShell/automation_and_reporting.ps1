# Export All User Details to CSV:
Get-ADUser -Filter * -Property DisplayName, EmailAddress, Title | Select-Object DisplayName, EmailAddress, Title | Export-Csv -Path "C:\UsersReport.csv" -NoTypeInformation

# Export Group Members to CSV:
Get-ADGroupMember -Identity "GroupName" | Select-Object Name | Export-Csv -Path "C:\GroupMembers.csv" -NoTypeInformation

# Automate Account Unlock for All Locked-Out Users:
Search-ADAccount -LockedOut | ForEach-Object { Unlock-ADAccount -Identity $_.SamAccountName }
