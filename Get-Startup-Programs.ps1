
#CMD or Powershell
	# Using WMI (Windows Management Instrumentation)
	# List of all the applications along with their paths that run at Windows startup.
		wmic startup get caption,command

	# Export the list out as a text file
		wmic startup get caption,command > c:\StartupApps.txt
	
	
# Getting the same information using modern and powerful PowerShell!
	Get-CimInstance Win32_StartupCommand | Select-Object Name, command, Location, User | Format-List 

# Exporting information to text file
	Get-CimInstance Win32_StartupCommand | Select-Object Name, command, Location, User | Format-List | Out-File c:\scripts\test.txt	

