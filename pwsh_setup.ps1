if ($IsWindows)
{
    $nvimConfDir = (Join-Path $env:LOCALAPPDATA "nvim")
    if (-not (Test-Path $nvimConfDir))
    {
        New-Item -Path $nvimConfDir -ItemType Junction -Value ${HOME}\.config\nvim
    }

    Get-Content -Path ${HOME}\.config\powershell\Microsoft.PowerShell_profile.ps1 | Set-Content -Path $PROFILE

} else {
    Write-Host "👍"
}
