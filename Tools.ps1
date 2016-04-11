function Get-SystemInfo {
    <#
    .SYNOPSIS
    Quesries critical computer information from a single machine.
    .Description
    Queries OS and hardware information from a single computer. This utilizes WMI, so the appropriate WMI ports must be open and you must be admin on the remote machine
    .PARAMETER ComputerName
    The name or IP address of the computer to query.
    .Example
    .\Get-SystemInfo -ComputerName WHATEVER
    This will query information from the computer WHATEVER
    .Example
    .\Get-SystemInfo -ComputerName WHATEVER | Format-Table *
    This will display the information in a table
    Get-Help (update help database)
        format from 
            help about_Comment*
    Information about script parameters
        help .\Get-SystemInfo.ps1
        help .\Get-SystemInfo.ps1 -Full
    #>

    #Enter computer name here
    param (
            [string]$ComputerName = 'localhost'
    )
    $os = Get-WmiObject -Class win32_operatingsystem -ComputerName $ComputerName
    $cs = Get-WmiObject -Class win32_computersystem -ComputerName $ComputerName
    # Merging os and cs together
    #hash table
    $props = @{'ComputerName'= $ComputerName;
                'OSVersion' = $os.version;
                'OSBuild' = $os.buildnumber;
                'SPVersion' = $os.servicepackmajorversion;
                'Model' = $cs.model;
                'Manufacturer' = $cs.manufacturer;
                'Memory' = $cs.totalphysicalmemory / 1GB -as [int];
                'Sockets' = $cs.numberofprocessors;
                'Cores' = $cs.numberoflogicalprocessors}
    $obj = New-Object -TypeName PSObject -Property $props
    Write-Output $obj
}

Get-SystemInfo -ComputerName DESKTOP-OU6H496;
