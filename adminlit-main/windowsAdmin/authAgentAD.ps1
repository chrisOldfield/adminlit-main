# This PowerShell script retrieves a specific property from the Windows Registry.
# The property is related to Azure AD Password Protection.

# The registry path where the property is located.
$RegistryPath = "HKLM:\SOFTWARE\Microsoft\AzureADPasswordProtection"

# The specific property to be retrieved.
$Property = "Version"

# Get-ItemProperty is a cmdlet that gets the properties of a specified item.
# -Path specifies the path to the registry key.
# -Name specifies the name of the property to be retrieved.
# The final .$Property retrieves the value of the specified property.
(Get-ItemProperty -Path $RegistryPath -Name $Property).$Property