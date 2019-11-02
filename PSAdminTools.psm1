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
    [parameter()]
    [String]$Account
	)

	Begin
	{
		
		Write-Debug "Checking for administrative privileges."
		$User = [Security.Principal.WindowsIdentity]::GetCurrent()
		$Role = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

		If(!$Role)
		{
			Write-Warning "To perform some operations you must run an elevated Windows PowerShell console."	
		} #End If !$Role

  }

  Process
  {
		$Username="anthony.cavella.adm"

Get-ADUser $Username -Properties badpwdcount,lockedout

$Pdce=(Get-ADDomain).PDCEmulator

$GweParams=@{
    'Computername'=$Pdce
    'LogName'='Security'
    'FilterXPath'="*[System[EventID=4740] and 
    EventData[Data[@Name='TargetUserName']='$Username']]"
}

$Events=Get-WinEvent @GweParams

$Events | foreach {$_.Properties[1].Value}
  }

  End{}
}
