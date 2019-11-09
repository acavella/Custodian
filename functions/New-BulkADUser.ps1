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
			$firstname=$row.firstname
			$lastname=$row.lastname 
			$password=$row.password
			Write-Debug -Message "Creating account: $username"
			New-ADUser -samaccountname $username -name "$lastname, $firstname" -givenname $firstname -surname $lastname -enabled $true -displayname "$lastname, $firstname" -accountpassword (convertto-securestring $password -asplaintext -force)
		}
	}
    End{}
}