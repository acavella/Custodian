@{
    ModuleVersion = '0.0.1'
    GUID = 'e1e8d83f-b832-45d7-ac89-4b7e27b60b8f'
    Author = 'Tony Cavella'
    Copyright = 'Copyright (c) 2019 Tony Cavella, licensed under Apache 2.0 License.'
    Description = 'Fully featured windows system administration and operations tools.'
    PowerShellVersion = '4.0'
    NestedModules = @(
    '.\functions\Get-UserLockout.psm1', 
    '.\functions\Remove-OldFiles.psm1'
  )
  FunctionsToExport = @('*')
}
