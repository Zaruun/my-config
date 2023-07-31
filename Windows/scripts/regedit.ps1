$regeditJson = Get-Content -Raw -Path ".\scripts\regedit.json" | ConvertFrom-Json

foreach ($item in $regeditJson.PSObject.Properties) {
    $comment = $item.Name
    $name = $item.Value.Name
    $path = $item.Value.Path
    $value = $item.Value.Value

    $command = "Set-ItemProperty -Path '$path' -Name $name -Value $value"
    Write-Output "# $comment"
    Write-Output $command
}
