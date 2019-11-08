<#
	.SYNOPSIS
		 Removes files older than X days
	.DESCRIPTION
		 Removes files older than X days in user specified directory.
	.PARAMETER Path
		Specify the path of files
	.PARAMETER Days
		Specify the number of days 
    .PARAMETER Recurse
        Recurse sub folders
#>

Function Remove-OldFiles
{
	[CmdletBinding()]
	Param
	(
    	[parameter(Mandatory=$true)]
        [String] $Path,
        [parameter(Mandatory=$true)]
        [String] $Days,
        [parameter(Mandatory=$false)]
        [Switch] $Recurse
	)

	Begin
	{
		Write-Debug "Checking for administrative privileges."
		$CurrentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
		$Role = (New-Object Security.Principal.WindowsPrincipal $CurrentUser).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

		If(!$Role)
		{
			Write-Warning "This module must be run-as an administrator."
			Exit	
		}
	}
    Process
    {
        If($Recurse){
            Get-ChildItem –Path $Path -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-$Days))}
        }
        If(!$Recurse){
            Get-ChildItem -Path $Path | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-$Days))}
        }
    }

	End{}
}