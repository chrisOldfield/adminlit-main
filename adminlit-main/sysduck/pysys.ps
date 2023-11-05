<#
.SYNOPSIS
This script gathers detailed system information, boot variables, and file system attributes.

.DESCRIPTION
To gather system information, boot variables, and file system attributes in PowerShell, 
you can use various cmdlets like Get-ComputerInfo, Get-WmiObject, Get-CimInstance, and bcdedit. 
This script utilizes these cmdlets to collect and format this information for review or troubleshooting purposes.

.NOTES
Author: Your Name
Date: Add the current date
#>

# Function to get system information
function Get-SystemInformation {
    Write-Host "Gathering System Information..."
    # Get-ComputerInfo provides a comprehensive set of OS, hardware, and network information
    $systemInfo = Get-ComputerInfo
    return $systemInfo
}

# Function to get boot configuration data
function Get-BootConfiguration {
    Write-Host "Gathering Boot Configuration Data..."
    # bcdedit is used to modify the boot configuration data store (BCD) in Windows
    # The output of bcdedit is captured from within PowerShell
    $bootConfig = bcdedit /enum all
    return $bootConfig
}

# Function to get filesystem attributes
function Get-FileSystemAttributes {
    Write-Host "Gathering File System Attributes..."
    # Get-PSDrive is used to get information about filesystem drives
    $drives = Get-PSDrive -PSProvider 'FileSystem'
    $fileSystemInfo = $drives | ForEach-Object {
        $drive = $_
        # Get-ItemProperty retrieves properties of a specified item (in this case, the filesystem root)
        $attributes = Get-ItemProperty -Path "$($drive.Root)" | Select-Object -Property *
        return @{
            "Drive" = $drive.Name
            "Used (GB)" = [math]::Round($drive.Used / 1GB, 2)
            "Free (GB)" = [math]::Round($drive.Free / 1GB, 2)
            "Attributes" = $attributes.Attributes
        }
    }
    return $fileSystemInfo
}

# Main script execution
Write-Host "System Information Script"

# Get and display system information
$systemInfo = Get-SystemInformation
$systemInfo | Format-List | Out-String | Write-Host

# Get and display boot configuration data
$bootConfig = Get-BootConfiguration
Write-Host $bootConfig

# Get and display filesystem attributes
$fileSystemInfo = Get-FileSystemAttributes
$fileSystemInfo | Format-Table | Out-String | Write-Host

# Suggest reboot
Write-Host "To apply any changes to the system, please reboot your system."
