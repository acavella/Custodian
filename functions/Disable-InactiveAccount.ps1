<#
	.SYNOPSIS
		 Bulk creation of AD Users
	.DESCRIPTION
		 Automatically creates AD users from CSV source file.
	.PARAMETER Path
		Specify the path of CSV parameter file
	.INPUTS
		Comma Seperated Values (CSV) containing account details.

		Format:
		username,firstname,lastname,password
		<string>,<string>,<string>,<string>
#>
Function Disable-InactiveAccount
{
	[CmdletBinding()]
	Param
	(
    	[parameter(Mandatory=$true)]
        [String] $Days
	)
    Begin{
		Import-Module ActiveDirectory
		$csvfile=Import-Csv -Path $Path
    }
    Process{}
    End{}