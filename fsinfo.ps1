
Param(
        [Parameter(Mandatory=$true)][string]$path,
        $directory = (get-item ($path))
)

    if ($PSBoundParameters.Count -ne 0){$directory = get-item $directory}

    $root = $directory.Root.Name -replace '\\',""
    $partition = get-CimInstance Win32_LogicalDisk -Filter  ("DeviceID like '$root'")
    $takenSpace =  100 - ((($partition).freespace / ($partition).Size) * 100)
    Write-Output("Filen " + $directory.Name + " befinner seg paa " + $root +  " og er " + $takenSpace +  "% full" )

    $fileCount = $directory.GetFiles().Count

    Write-Output("Det finnes " + $fileCount + " filer.")


    $prevSize = 0
    $sumSize = 0
    $fileName = ""
    $directory.GetFiles() | ForEach-Object{
      $sumSize = $sumSize + $_.Length
      if($_.Length -gt $prevSize){
        $prevSize = $_.Length
        $fileName = $_.Name
      }
    }

    Write-Output("Den storste filen er " + $path + "\" + $fileName)
    Write-Output("som er " + $prevSize + "B stor." )
    Write-Output("Gjennomsnittlig filstorrelse er " + $sumSize / $fileCount + "B.")
