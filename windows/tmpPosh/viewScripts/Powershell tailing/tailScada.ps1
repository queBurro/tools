
#have to have this policy set...
#set-executionpolicy unrestricted 

Echo "tailing Scada log for errors..."

$logPath = "C:\Logs\ScadaController\"
$lastLog = get-childitem $logPath | Sort CreationTime -Descending | Select Name -First 1 
#$cmdlet1 = { 
Get-Content ($logPath + $lastLog.name) -Wait  | Select-string -Pattern ( "error", "exception", "Not yet initialised", "connected"  ) | Write-Host -ForegroundColor Red
#}

#$logPath = "C:\Logs\Simulator\"
#$lastLog = get-childitem $logPath | Sort CreationTime -Descending | Select Name -First 1 
#$cmdlet2 = { Get-Content ($logPath + $lastLog.name) -Wait | Select-string "Event", "error", "exception" }

#run jobs async
#Start-Job -ScriptBlock { $cmdlet1 }
#Start-Job -ScriptBlock { $cmdlet2 }

#$cmdlet1

