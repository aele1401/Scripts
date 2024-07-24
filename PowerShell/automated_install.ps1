# Define the list of software to install with their paths and installation commands
$softwareList = @(
    @{
        Name = "Google Chrome";
        Path = "\\server\share\GoogleChromeStandaloneEnterprise64.msi";
        InstallCommand = "msiexec.exe /i `"$($_.Path)`" /qn"
    },
    @{
        Name = "7-Zip";
        Path = "\\server\share\7z1900-x64.msi";
        InstallCommand = "msiexec.exe /i `"$($_.Path)`" /qn"
    },
    @{
        Name = "Notepad++";
        Path = "\\server\share\npp.7.8.5.Installer.x64.exe";
        InstallCommand = "$($_.Path) /S"
    }
)

# Function to check if a software is already installed
function IsSoftwareInstalled {
    param (
        [string]$softwareName
    )
    $installed = Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" |
                 Where-Object { $_.DisplayName -like "*$softwareName*" }

    return $null -ne $installed
}

# Install each software in the list
foreach ($software in $softwareList) {
    Write-Host "Checking if $($software.Name) is already installed..."
    if (IsSoftwareInstalled -softwareName $software.Name) {
        Write-Host "$($software.Name) is already installed."
    } else {
        Write-Host "Installing $($software.Name)..."
        try {
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $($software.InstallCommand)" -Wait -NoNewWindow
            Write-Host "$($software.Name) installation completed successfully."
        } catch {
            Write-Error "Failed to install $($software.Name). Error: $_"
        }
    }
}

Write-Host "All installations completed."
