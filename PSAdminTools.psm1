<#
	.SYNOPSIS
		 Diagnos user account lockouts
	.DESCRIPTION
		 Queries primary domain controller to find out why account is locked.
	.PARAMETER Account
		Specify the user/account name to query for.
#>

Function Get-UserLockout
{
	[CmdletBinding()]
	Param
	(
    	[parameter(Mandatory=$true)]
		[String] $Account
	)

	Begin
	{
		Write-Debug "Checking for administrative privileges."
		$User = [Security.Principal.WindowsIdentity]::GetCurrent()
		$Role = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

		If(!$Role)
		{
			Write-Warning "This module must be run-as an administrator."
			Exit	
		}
		Write-Debug "Loading Active Directory module."
		Import-Module -Name "ActiveDirectory"
	}
	Process
  	{
		Get-ADUser $Account -Properties badpwdcount,lockedout
		$Pdce=(Get-ADDomain).PDCEmulator
		$GweParams=@{
			'Computername'=$Pdce
			'LogName'='Security'
			'FilterXPath'="*[System[EventID=4740] and 
			EventData[Data[@Name='TargetUserName']='$Account']]"
		}
		$Events=Get-WinEvent @GweParams
		$Events | ForEach-Object {$_.Properties[1].Value}
  	}

	End{}
}
