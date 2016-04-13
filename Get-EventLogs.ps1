#Get Event logs

#List all Event log names
	Get-EventLog -list

#Displays System Event log
	Get-EventLog System

#Display Powershell Event Log
	Get-EventLog 'Windows PowerShell'

#Display Applicaiton Event Logs
	Get-EventLog Application

# Displays the five most recent entries from the Application event log
	get-eventlog -newest 5 -logname application

#gets only error events from the System event log
	get-eventlog -logname System -EntryType Error

#find all of the sources that are represented in the 1000 most recent entries in the System event log.
	$events = get-eventlog -logname system -newest 1000
	$events | group-object -property source -noelement | sort-object -property count –descending

#This example shows how to display the property values of an event in a list.
#The first command gets the newest event from the System event log and saves it in the $a variable.
#The second command uses a pipeline operator (|) to send the event in $a to the Format-List command, which displays all (*) of the event properties.
	$a = get-eventlog -log System -newest 1
	$a | format-list -property *