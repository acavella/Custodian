<#
	.SYNOPSIS
		 Retrieves basic host details
	.DESCRIPTION
		 Retrieves basic environmental details about the host.
	.PARAMETER Computer
		Specify the host to retrieve details from.
#>
Function Get-HostDetails {
	[CmdletBinding()]
	Param
	(
    	[parameter(Position = 0, Mandatory = $False)]
        [String] $Computer = $env:COMPUTERNAME
	)
	
	If ($Computer -ne $env:COMPUTERNAME) {
		Write-Warning -Message "Retrieving details for remote hosts is currently not supported, returning local details."
	}

	
	$drives = Get-PSDrive -PSProvider Filesystem | Select-Object -Property Name,Used,Free
	
    $system = @{
		Hostname = $env:COMPUTERNAME
    	HostDomain = $env:USERDOMAIN
    	CurrentUser = $env:USERNAME
    	Processor = $env:PROCESSOR_IDENTIFIER
    	ProcessorArchitecture = $env:PROCESSOR_ARCHITECTURE
		ProcessorCores = $env:NUMBER_OF_PROCESSORS
		LogicalDrives = $drives
	}

	Write-Output $system
    
}