# Variables
$buildFile = '.\config.ps1'

# Check if build file exist and delete 
if (Test-Path $buildFile) {
    Remove-Item $buildFile -Force
}

# Function to add content from file
function AddContentFromFile ($file) {
    Add-Content -Path $buildFile -Value " "
    $content = Get-Content -Path $file
    $content | Out-File -FilePath $buildFile -Append -Encoding UTF8
}

# Function to add contetn from string
function AddContentFromString ($string) {
    Add-Content -Path $buildFile -Value " "
    Add-Content -Path $buildFile -Value "$string"
}

function ConsoleLog($desc, $color="Cyan") {
    write-host "$desc" -ForegroundColor $color
}

ConsoleLog "🧰 Start script build" "Magenta"
ConsoleLog ""

Add-Content -Path $buildFile -Value "#=============================================================="
Add-Content -Path $buildFile -Value "# Script created by build.ps1 - any changes will be overwriten "
Add-Content -Path $buildFile -Value "#=============================================================="

ConsoleLog "✅ Update PowerShell to lastes version"
AddContentFromFile .\scripts\updatePowershell.ps1

ConsoleLog "✅ Install WSL and Ubuntu 22.04"
AddContentFromFile .\scripts\wsl.ps1

ConsoleLog "✅ Uninstall by Winget"
AddContentFromFile .\scripts\winget-uninstall.ps1

ConsoleLog "✅ Install by Winget"
AddContentFromFile .\scripts\winget-install.ps1

ConsoleLog ""
ConsoleLog "🏁 Done." "Magenta"