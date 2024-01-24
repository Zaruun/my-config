# Variables
$buildFile = '.\script.ps1'
$buildReadme = '.\Readme.md'

# Check if build file exist and delete 
if (Test-Path $buildFile) {
    Remove-Item $buildFile -Force
}
if (Test-Path $buildReadme) {
    Remove-Item $buildReadme -Force
}

# Function to add content from file
function AddContentFromFile ($file) {
    Add-Content -Path $buildFile -Value " "
    $content = Get-Content -Path $file
    $content | Out-File -FilePath $buildFile -Append -Encoding UTF8
}

# Function to add content from .ps1 script output
function AddContentFromScript ($file) {
    Add-Content -Path $buildFile -Value " "
    $scriptOutput = $file | Invoke-Expression 
    Add-Content -Path $buildFile -Value $scriptOutput -Encoding UTF8
}

# Function to add content from file to Readme.md as code with custome title
function AddContentFromFileToReadme {
    param (
        [Alias("f")]
        [string]$file,

        [Alias("t")]
        [string]$title
    )

    Add-Content -Path $buildReadme -Value "### $title"
    Add-Content -Path $buildReadme -Value '```powershell'
    $content = Get-Content -Path $file
    $content | Out-File -FilePath $buildReadme -Append -Encoding UTF8
    Add-Content -Path $buildReadme -Value '```'
}

# Function to add content from script .ps1 output to Readme.md as code with custome title
function AddContentFromScriptToReadme {
    param (
        [Alias("f")]
        [string]$file,

        [Alias("t")]
        [string]$title
    )

    Add-Content -Path $buildReadme -Value "### $title"
    Add-Content -Path $buildReadme -Value '```powershell'
    $scriptOutput = $file | Invoke-Expression 
    Add-Content -Path $buildReadme -Value $scriptOutput -Encoding UTF8
    Add-Content -Path $buildReadme -Value '```'
}

function ConsoleLog($desc, $color="Cyan") {
    write-host "$desc" -ForegroundColor $color
}

ConsoleLog "🧰 Start script build" "Magenta"
ConsoleLog ""

Add-Content -Path $buildFile -Value "#=============================================================="
Add-Content -Path $buildFile -Value "# Script created by build.ps1 - any changes will be overwriten "
Add-Content -Path $buildFile -Value "#=============================================================="

Add-Content -Path $buildReadme -Value "# Windows configuration commands"

ConsoleLog "✅ Set dark theme"
AddContentFromFile .\scripts\theme-dark.ps1
AddContentFromFileToReadme -f .\scripts\theme-dark.ps1 -t "Set dark theme"

ConsoleLog "✅ Update PowerShell to lastes version"
AddContentFromFile .\scripts\updatePowershell.ps1
AddContentFromFileToReadme -f .\scripts\updatePowershell.ps1 -t "Update Powershell to lastes version"

ConsoleLog "✅ Install WSL and Ubuntu 22.04"
AddContentFromFile .\scripts\wsl.ps1
AddContentFromFileToReadme -f .\scripts\wsl.ps1 -t "Install WSL and Ubuntu 22.04"

ConsoleLog "✅ Restart Computer - Readme.md"
AddContentFromFileToReadme -f .\scripts\restart-computer.ps1 -t "Restart Computer"

ConsoleLog "✅ Uninstall by Winget"
AddContentFromFile .\scripts\winget-uninstall.ps1
AddContentFromFileToReadme -f .\scripts\winget-uninstall.ps1 -t "Uninstall by Winget"

ConsoleLog "✅ Install by Winget"
AddContentFromFile .\scripts\winget-install.ps1
AddContentFromFileToReadme -f .\scripts\winget-install.ps1 -t "Install by Winget"

ConsoleLog "✅ Powermgmt settings"
AddContentFromFile .\scripts\powermgmt.ps1
AddContentFromFileToReadme -f .\scripts\powermgmt.ps1 -t "Powermgmt settings"

ConsoleLog "✅ Regedit settings"
AddContentFromScript .\scripts\regedit.ps1
AddContentFromScriptToReadme -f .\scripts\regedit.ps1 -t "Regedit settings" 

ConsoleLog ""
ConsoleLog "🏁 Done." "Magenta"