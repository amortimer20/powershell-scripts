Write-Host "Installing Python v3.12 and VS Code" -ForegroundColor Green
Start-Sleep 3
winget install Python.Python.3.12 --scope machine
winget install Microsoft.VisualStudioCode --scope machine

# Reload path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

Write-Host "Installing Python packages and VS Code extensions" -ForegroundColor Green
Start-Sleep 3
pip install raylib
pip install rich
code --extensions-dir "%ProgramFiles%\Microsoft VS Code\resources\app\extensions" --install-extension ms-python.python --force
code --extensions-dir "%ProgramFiles%\Microsoft VS Code\resources\app\extensions" --install-extension paulober.pico-w-go --force

Write-Host "Running installers (See 'instructions.txt')" -ForegroundColor Green
Start-Sleep 3
Set-Location $PSScriptRoot
.\VisualStudioSetup.exe
.\UnityHubSetup.exe