# Winget packages
winget install Python.Python.3.12 --scope machine
winget install Microsoft.VisualStudioCode --scope machine

# Reload path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

# Packages & Extensions
pip install raylib
pip install rich
code --extensions-dir "%ProgramFiles%\Microsoft VS Code\resources\app\extensions" --install-extension ms-python.python --force

# Installers
Set-Location $PSScriptRoot
.\VisualStudioSetup.exe
.\UnityHubSetup.exe