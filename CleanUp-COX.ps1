$ErrorActionPreference = 'Stop'

try {
    $playlistPath = Convert-Path(".\cox\playlists")
    $currentPath = Convert-Path(".")
}
catch {
    Write-Host "Can't find the playlist directory"
    Exit-PSHostProcess
}

try {
    [System.Collections.ArrayList]$playlistGames = @()
    foreach ($file in Get-ChildItem -Path $playlistPath -Filter *.txt)
    {
        foreach ($game in Get-Content $file.FullName)
        {
            if (-Not ($game.Trim() -eq ""))
            {
                if (-Not ($playlistGames.Contains(($game.Trim().ToUpper() + ".UCE"))))
                {
                    $playlistGames.Add(($game.Trim().ToUpper() + ".UCE")) | Out-Null
                }
            }
        }
    }
}
catch {
    Write-Host "Failed to load playlists"
    Exit-PSHostProcess   
}

#Delete UCE that aren't in a playlist
try{
	foreach ($file in Get-ChildItem -Path $currentPath -Filter *.uce -Recurse)
	{
		if (-Not ($playlistGames.Contains($file.Name.ToUpper())))
		{
			Remove-Item $file.FullName
		}
	}
}
catch {
	Write-Host "Failed UCE Cleanup"
}

try {
    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\cover")) -Filter *.jpg)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".jpg", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }

    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\cover")) -Filter *.png)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".png", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }
}
catch {
    Write-Host "Failed Cover Cleanup"
}

try {
    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\custom")) -Filter *.jpg)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".jpg", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }

    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\custom")) -Filter *.png)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".png", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }
}
catch {
    Write-Host "Failed Custom Cleanup"
}

try {
    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\logo")) -Filter *.jpg)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".jpg", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }

    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\logo")) -Filter *.png)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".png", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }
}
catch {
    Write-Host "Failed Logo Cleanup"
}

try {
    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\marquee")) -Filter *.jpg)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".jpg", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }

    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\marquee")) -Filter *.png)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".png", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }
}
catch {
    Write-Host "Failed Custom Cleanup"
}

try {
    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\video")) -Filter *.avi)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".avi", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }

    foreach($file in Get-ChildItem -Path (Convert-Path(".\cox\video")) -Filter *.mp4)
    {
        $searchUCE = Get-ChildItem -Path (Convert-Path(".")) -Filter $file.Name.Replace(".mp4", ".uce") -Recurse
        
        if ($searchUCE.Count -eq 0)
        {
            Remove-Item $file.FullName
        }
    }
}
catch {
    Write-Host "Failed Custom Cleanup"
}