# Add a User to a Group:Add a User to a Group:
Add-ADGroupMember -Identity "GroupName" -Members "jdoe"

# Remove a User from a Group:
Remove-ADGroupMember -Identity "GroupName" -Members "jdoe"

# List All Members of a Group:
Get-ADGroupMember -Identity "GroupName"

# Create a New Group:
New-ADGroup -Name "NewGroup" -GroupScope Global -Path "OU=Groups,DC=domain,DC=com"
