# Define software details
$ApplicationName = "MyApp"
$PackagePath = "\\server\share\MyApp.msi"

# Connect to SCCM
$SCCMServer = "SCCMServer"
Import-Module "$SCCMServer\bin\ConfigurationManager.psd1"
Set-Location "$SCCMServer:\"

# Create SCCM application
New-CMApplication -Name $ApplicationName -Description "My Application"

# Create deployment type
New-CMDeploymentType -ApplicationName $ApplicationName -DeploymentTypeName "MSI" -DeploymentTypeDescription "MSI Installer" -InstallationFileLocation $PackagePath
