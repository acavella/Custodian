<#
	.SYNOPSIS
		 Bulk creation of AD Users
	.DESCRIPTION
		 Bulk creation of AD users specified in CSV configuration file.
	.PARAMETER Path
		Specify the path of CSV parameter file
#>
Function New-BulkADUser
{
	[CmdletBinding()]
	Param
	(
    	[parameter(Mandatory=$true)]
        [String] $Path
	)
    Begin{}
    Process{}
    End{}
}