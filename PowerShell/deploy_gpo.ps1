# Define software details
$GPOName = "Software Deployment GPO"
$SoftwarePath = "\\server\share\MyApp.msi"
$PolicyName = "MyApp Deployment"

# Create GPO
New-GPO -Name $GPOName

# Link GPO to an OU
New-GPLink -Name $GPOName -Target "OU=Workstations,DC=domain,DC=com"

# Add software to GPO
Set-GPPrefRegistryValue -Name $GPOName -Key "HKLM\Software\Policies\Microsoft\Windows\Installer" -ValueName "Logging" -Value "voicewarmup"
