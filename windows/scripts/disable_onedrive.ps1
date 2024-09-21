# include registry functions
. $PSScriptRoot\include\registry.ps1

$elevated = ([Security.Principal.WindowsPrincipal] `
 [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (!($elevated)) {
    Write-Host -F red "This script requires administrator privileges, the script will not run for safety reasons"

    exit
}

$onedrive = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StorageProvider\OneDrive"
$factory = "StorageProviderKnownFolderSyncInfoSourceFactory"

Take-Permissions "HKCU" "Software\Microsoft\Windows\CurrentVersion\Explorer\StorageProvider\OneDrive" "S-1-1-0"

$knownFolderSync = Test-fqbRegistryValue $onedrive $factory

if (!($knownFolderSync)) {
    New-Item -Path $onedrive -Name $factory
}

Set-ItemProperty -Path $onedrive -Name $factory -Value "{null}"

#Remove Inheritance - Inheritance is removed from both keys so that if one is done the other will have to be also.
$acl = Get-Acl $onedrive
$acl.SetAccessRuleProtection($true, $true)
Set-Acl $onedrive $acl
