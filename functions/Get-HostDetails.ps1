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
		Write-Warning -Message "Host details for remote systems are currently not supported, returning $env:COMPUTERNAME"
	}
	
    $system = @{
		Hostname = $env:COMPUTERNAME
    	HostDomain = $env:USERDOMAIN
    	CurrentUser = $env:USERNAME
    	Processor = $env:PROCESSOR_IDENTIFIER
    	ProcessorArchitecture = $env:PROCESSOR_ARCHITECTURE
		ProcessorCores = $env:NUMBER_OF_PROCESSORS
		LogicalDrives = Get-PSDrive -PSProvider FileSystem
	}

	Write-Output $system
    
}