<#
	.SYNOPSIS
		 Disables inactive AD accounts
	.DESCRIPTION
		 Disables AD accounts that have been inactive for a specified period of time.
	.PARAMETER Days
		Specify the number of days an account has been inactive.
	.INPUTS
		Comma Seperated Values (CSV) containing account details.

		Format:
		username,firstname,lastname,password
		<string>,<string>,<string>,<string>
#>
Function Disable-InactiveAccount {
	[CmdletBinding()]
	Param
	(
    	[parameter(Mandatory=$true)]
        [String] $Days
	)
    Begin {
        #Import-Module ActiveDirectory
        
    }
    Process {}
    End {}
}