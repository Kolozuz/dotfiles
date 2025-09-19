function Profile-Config
{

    Write-Host "[Profile] Configuring profile..."
    if (Test-Path $PROFILE)
    {
        Write-Host "[Profile] Profile found. Cleaning profile..."
        Set-Content -Path $PROFILE -Value ""
    } else {    
        Write-Host "[Profile] No profile was found. Creating profile..."
        New-Item -Path $PROFILE -ItemType File
    }

    # Set Key bindings
    $editMode = "Vi"
    Add-Content -Path $PROFILE -Value "Set-PSReadLineOption -EditMode $editMode"
    Write-Host "[Profile] Key bindings set to '$editMode'"

    # Import custom modules
    # No havo custom modules yet

    # Set environment vars
    # No uso ninguna yet

    # Setup programs
    Write-Host "[Profile] Setting up programs..."
    $commands = @{
        "fnm" = "fnm env --use-on-cd | Out-String | Invoke-Expression"
        "starship" = "Invoke-Expression (&starship init powershell)"
    }
    
    foreach ($program in $commands.Keys) {
        Write-Host "[Profile] Setting up '$program'..."
        
        if (Get-Command $program -ErrorAction SilentlyContinue) {
            Add-Content -Path $PROFILE -Value "`n$($commands[$program])"
            Write-Host "[Profile] Program '$program' set up succesfully!"
        } else {
            Write-Host "[Profile] ERROR: command '$program' not found, make sure it is installed and added to your PATH"
        }
    
    }

    Write-Host "[Profile] Profile configured!"

}

function Set-Symlinks {

    Write-Host "[Config] Setting up symlinks..."

    $programs = @(
        "nvim" 
    )

    foreach ($program in $programs) {
    
        if ($IsWindows)
        {
            $windowsConfigDir = (Join-Path $env:LOCALAPPDATA $program)
            $configDir = "${HOME}\.config\$program"
            if (!(Test-Path $windowsConfigDir))
            {
                New-Item -Path $windowsConfigDir -ItemType Junction -Value $configDir
                Write-Host "[Config] Symlink to '$configDir' set in '$windowsConfigDir'"
            }
        
        } else {
            Write-Host "[Config] All good 👍"
        }
        
    }

}

Profile-Config
Set-Symlinks
