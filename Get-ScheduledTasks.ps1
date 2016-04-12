


# The purpose of this script is to find scheduled tasks on a windows machine

Get-ScheduledTask
Get-ScheduledTask -TaskName "SystemScan"

Get-ScheduledTask | Where-Object { $_.State -ne "Disabled" }
Get-ScheduledTask | Where-Object { $_.State -ne "Enabled" }
Get-ScheduledTask | Where-Object { $_.State -eq "Running" }
Get-ScheduledTask | Where-Object { $_.State -eq "Ready" }