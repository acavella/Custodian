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
    
    $system = @{
		hostname = $env:COMPUTERNAME
    	domain = $env:USERDOMAIN
    	current_user = $env:USERNAME
    	processor = $env:PROCESSOR_IDENTIFIER
    	architecture = $env:PROCESSOR_ARCHITECTURE
		core_count = $env:NUMBER_OF_PROCESSORS
		logical_drives = Get-PSDrive -PSProvider FileSystem
	}

	Write-Output $system
    
}