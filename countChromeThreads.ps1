# countChromeThreads.ps1

Get-Process("chrome") |  ForEach-Object{$_.Name+" "+$_.Id+" "+($_.Threads).Count}
