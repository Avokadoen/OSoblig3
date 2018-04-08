Param(
        [Parameter(Mandatory=$true)][string]$path,
        $directory = (get-item ($path))
)

    if ($PSBoundParameters.Count -ne 0){$directory = get-item $directory}

    Write-Host $path
    Write-Host $directory
    $root = $directory.Root.Name -replace '\\','%'
    Get-CimInstance Win32_logicaldisk -Filter ("DeviceID like '$root%'")|  Select-Object SystemName,@{Name="Drive Letter";Expression={$_.DeviceID}},
                                                @{Name="Drive Label";Expression={$_.VolumeName}},`
                                                @{Name="Size(MB)";Expression={"{0:N0}" -f [int]($_.Size / 1MB)}},`
                                                @{Name="FreeSpace%";Expression={[math]::Round($_.FreeSpace / $_.Size,2)*100}}  | ft
