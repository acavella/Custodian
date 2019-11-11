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
    
    Write-Host "[+] Hostname = $env:COMPUTERNAME"
    Write-Host "[+] Domain = $env:USERDOMAIN"
    Write-Host "[+] User = $env:USERNAME"
    Write-Host "[+] Processor: $env:PROCESSOR_IDENTIFIER"
    Write-Host "[+] Architecture: $env:PROCESSOR_ARCHITECTURE"
    Write-Host "[+] Cores: $env:NUMBER_OF_PROCESSORS"
    
}