# PowerShell helper to prepare dist/ and create deploy_package.zip
Set-Location -Path $PSScriptRoot

if (!(Test-Path .\dist)) { New-Item -ItemType Directory -Path .\dist | Out-Null }

# Copy the main HTML
Copy-Item .\scriptV5.index.html -Destination .\dist\index.html -Force

# Ensure SCRIPT_URL is present in the copied file (no automatic change)
Write-Output "Copied scriptV5.index.html -> dist/index.html"

# Create zip
$zipPath = Join-Path $PSScriptRoot 'deploy_package.zip'
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
Compress-Archive -Path .\dist\* -DestinationPath $zipPath -Force
Write-Output "Created $zipPath"
