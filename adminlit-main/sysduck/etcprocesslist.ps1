# List running processes parsed by etc paths
Write-Host "Running processes with command paths starting with /etc:"
Get-Process | Where-Object { $_.Path -like "/etc/*" } | Format-Table Id, Path -AutoSize

# Sort processes by CPU and memory usage (highest to lowest)
Write-Host "`nProcesses sorted by system utilization (highest to lowest):"
Get-Process | Sort-Object CPU, WS -Descending | Select-Object Id, ProcessName, CPU, WS -First 5 | Format-Table -AutoSize

# Find the service with the highest memory and CPU usage
# Note: PowerShell does not have a direct equivalent to systemd-cgtop, but we can use Get-WmiObject to query service information
Write-Host "`nService responsible for the highest memory and CPU usage:"
Get-WmiObject Win32_Service | ForEach-Object {
    $process = Get-Process | Where-Object { $_.Id -eq $_.ProcessId }
    $_ | Add-Member -NotePropertyName CPU -NotePropertyValue $process.CPU
    $_ | Add-Member -NotePropertyName WS -NotePropertyValue $process.WS
    $_ | Sort-Object CPU, WS -Descending | Select-Object Name, DisplayName, CPU, WS -First 1 | Format-Table -AutoSize
}