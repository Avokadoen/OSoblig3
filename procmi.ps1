Param([string[]]$param = $(throw "please send atleast one processID"))


    foreach ($procID in $param){
      $frame="******** Minne info om prosess med PID " + $procID +" ********`r`n"
      $vmsInfo = "Total bruk av virtuelt minne: " + (Get-Process -ID $procID).VirtualMemorySize/1MB + "MB`r`n"
      $vsInfo = "Storrelse paa Working Set: " + (Get-Process -ID $procID).WorkingSet/1KB + "KB`r`n"
      $fileContent = $frame + $vmsInfo + $vsInfo
      $path = "./" + ($procID) + (Get-Date -UFormat "--%Y%m%u--%H%M%S") + ".meminfo"
      $fileContent | Out-File $path
    }
