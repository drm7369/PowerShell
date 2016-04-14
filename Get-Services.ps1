

# Displays all services - Sort services first by Status, and then by DisplayName
	Get-Service | Sort-Object status,displayname

# Display all STOPED services - Sort services by DisplayName
	Get-Service | Where-Object {$_.status -eq "stopped"} | Sort-Object displayname
		
# Display all RUNNING services - Sort services by DisplayName
	Get-Service | Where-Object {$_.status -eq "running"} | Sort-Object displayname

