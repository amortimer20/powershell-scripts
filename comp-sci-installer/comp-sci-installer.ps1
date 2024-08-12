Write-DelayedOutput "Installing Python v3.12 and VS Code"
winget install Python.Python.3.12 --scope machine
winget install Microsoft.VisualStudioCode --scope machine

# Reload path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

Write-DelayedOutput "Installing Python packages and the Python extension for VS Code"
pip install raylib
pip install rich
code --extensions-dir "%ProgramFiles%\Microsoft VS Code\resources\app\extensions" --install-extension ms-python.python --force

Write-DelayedOutput "Running installers; See 'instructions.txt'"
Set-Location $PSScriptRoot
.\VisualStudioSetup.exe
.\UnityHubSetup.exe

function Write-DelayedOutput {
    param (
        [Parameter(Position=0)]
        [string]$Message,
        [double]$DelayTime = 3
    )

    Write-Host $Message -ForegroundColor Green
    Start-Sleep $DelayTime
}