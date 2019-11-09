<#
	.SYNOPSIS
		 Bulk creation of AD Users
	.DESCRIPTION
		 Bulk creation of AD users specified in CSV configuration file.
	.PARAMETER Path
		Specify the path of CSV parameter file
	.EXAMPLE
	
#>
Function New-BulkADUser
{
	[CmdletBinding()]
	Param
	(
    	[parameter(Mandatory=$true)]
        [String] $Path
	)
    Begin{
		Import-Module ActiveDirectory
		$csvfile=Import-Csv -Path $Path
	}
    Process{
		Foreach ($row in $csvfile){
			$username=$row.username
			$password=$row.password
			$firstname=$row.firstname
			$lastname=$row.lastname 
			Write-Debug -Message "Creating account: $username"
			New-ADUser -samaccountname $username -name "$lastname, $firstname" -givenname $firstname -surname $lastname -enabled $true -displayname "$lastname, $firstname" -accountpassword (convertto-securestring $password -asplaintext -force)
		}
	}
    End{}
}