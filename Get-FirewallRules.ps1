#Display ffirewall rules

#Shows all firewalls rules
Get-NetFirewallRule

#display inbound firewall rules
Show-NetFirewallRule | where {$_.enabled -eq ‘true’ -AND $_.direction -eq ‘inbound’}| select displayname

#display outbound firewall rules
Show-NetFirewallRule | where {$_.enabled -eq ‘true’ -AND $_.direction -eq ‘outbound’}| select displayname

