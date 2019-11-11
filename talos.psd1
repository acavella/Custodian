@{
    ModuleVersion = '0.0.3'
    GUID = 'e1e8d83f-b832-45d7-ac89-4b7e27b60b8f'
    Author = 'Tony Cavella'
    Copyright = 'Copyright (c) 2019 Tony Cavella, licensed under Apache 2.0 License.'
    Description = 'Talos is a PowerShell module to assist with automation of Windows administrative tasks.'
    PowerShellVersion = '4.0'
    NestedModules = @(
    '.\functions\Get-ADLockoutDetails.ps1', 
    '.\functions\Remove-OldFiles.ps1',
    '.\functions\New-BulkADUser.ps1',
    '.\functions\Disable-InactiveAccount',
    '.\functions\Get-HostDetails'
  )
  FunctionsToExport = @('*')
}