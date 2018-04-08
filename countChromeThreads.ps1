# countChromeThreads.ps1

Get-Process("chrome") |  %{$_.Name+" "+$_.Id+" "+($_.Threads).Count}