param(
    [string]$OdtPath = "C:\odt",
    [string]$ConfigFile = "configuration-Office365-x64.xml"
)

Invoke-WebRequest "https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_17830-20162.exe" -OutFile ".\"
Start-Process ".\officedeploymenttool_17830-20162.exe" -Wait
Remove-Item ".\officedeploymenttool_17830-20162.exe"
Invoke-Expression "$OdtPath\setup.exe /configure $PSScriptRoot\$ConfigFile"