if (!(Test-Path -Path "c:\priv")) {
    Write-Output "Creating c:\priv"
    New-Item -Path "c:\priv" -ItemType "directory"
}

try {
    Write-Output "Copy settings.json"
    Copy-Item -Path .\settings.json -Destination $env:APPDATA\Code\User\settings.json
    Write-Output "✅ Copied settings.json"
}
catch {
    Write-Output "❌ Failed to copy settings.json"
}

try {
    Write-Output "Copy keybindings.json"
    Copy-Item -Path .\keybindings.json -Destination $env:APPDATA\Code\User\keybindings.json
    Write-Output "✅ Copied keybindings.json"
}
catch {
    Write-Output "❌ Failed to copy keybindings.json"
}

try {
    Write-Output "Copy init.lua"
    Copy-Item -Path .\init.lua -Destination c:\priv\init.lua
    Write-Output "✅ Copied init.lua"
}
catch {
    Write-Output "❌ Failed to copy init.lua"
}

$exts = Get-Content -Path .\extensions_list.txt
foreach ($ext in $exts) {
    $ext = $ext.Trim()
    code --install-extension $ext
}

