# Define application details
$AppName = "MyApp"
$Version = "1.0.0"
$SourcePath = "C:\Source\MyApp"
$OutputPath = "C:\Packages"

# Create MSI package
New-MsiPackage -Name $AppName -Version $Version -SourcePath $SourcePath -OutputPath $OutputPath
