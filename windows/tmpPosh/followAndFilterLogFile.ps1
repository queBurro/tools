


#Get-ChildItem "c:\irma22\testBad Path\irmalog.txt"  | Select-String -Pattern "| Err |"
#Get-Content -Path "c:\irma22\testBad Path\irmalog.txt" -Wait -Tail 3 | Select-String -Pattern "| Err |"
#Get-Content ($logPath + $lastLog.name) -Wait |  where-object {$_ -notmatch "HeartBeatMessage"} |  Write-Host -ForegroundColor yellow

Get-Content "c:\irma22\testBad Path\irmalog.txt" -Wait |  where-object {$_ -match "\| Err \|"} |  Write-Host -ForegroundColor yellow