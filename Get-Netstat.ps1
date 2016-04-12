<# function Get-NetStat1
	{
	<#
	.SYNOPSIS
		This function will get the output of netstat -n and parse the output
	.DESCRIPTION
		This function will get the output of netstat -n and parse the output
	#>
		PROCESS
		{
			# Get the output of netstat
			$data = netstat -n
			
			# Keep only the line with the data (we remove the first lines)
			$data = $data[4..$data.count]
			
			# Each line need to be splitted and get rid of unnecessary spaces
			foreach ($line in $data)
			{
				# Get rid of the first whitespaces, at the beginning of the line
				$line = $line -replace '^\s+', ''
				
				# Split each property on whitespaces block
				$line = $line -split '\s+'
				
				# Define the properties
				$properties = @{
					Protocole = $line[0]
					LocalAddressIP = ($line[1] -split ":")[0]
					LocalAddressPort = ($line[1] -split ":")[1]
					ForeignAddressIP = ($line[2] -split ":")[0]
					ForeignAddressPort = ($line[2] -split ":")[1]
					State = $line[3]
				}
				
				# Output the current line
				New-Object -TypeName PSObject -Property $properties
			}	
		}	
	}

		Get-NetStat1
 #>


function Get-NetStat2
	{
	<#
	.SYNOPSIS
		This function will get the output of netstat -n and parse the output
	.DESCRIPTION
		This function will get the output of netstat -n and parse the output
	#>
		PROCESS
		{

			FOREACH ($line in $data)
				{
					
					# Remove the whitespace at the beginning on the line
					$line = $line -replace '^\s+', ''
					
					# Split on whitespaces characteres
					$line = $line -split '\s+'
					
					# Define Properties
					$properties = @{
						Protocole = $line[0]
						LocalAddress = $line[1]
						ForeignAddress = $line[2]
						State = $line[3]
					}
					
					# Output object
					New-Object -TypeName PSObject -Property $properties
				}
		}
	}

	
	
	
	Get-NetStat2
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
#Now...Let's say you want to know the most frequent ForeignAddress IP, the count for each IP and ... don't want to show the header....

<# Get-NetStat |
    Group-Object -Property ForeignAddressIP |
    Select-Object -Property Count, Name |
    Sort-Object count -Descending |
    Format-Table -AutoSize -HideTableHeaders

 #>
