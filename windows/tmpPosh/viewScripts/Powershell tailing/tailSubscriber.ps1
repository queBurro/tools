
#have to have this policy set...
#set-executionpolicy unrestricted 

cls
Echo "tailing mosquitto log for errors..."


$logPath = "C:\Logs\mosquitto\"
$lastLog = get-childitem $logPath | Sort CreationTime -Descending | Select Name -First 1 
#$cmdlet2 = { 
Get-Content ($logPath + $lastLog.name) -Wait | Select-string -Pattern ( "error", "exception", "unknown"  ) | Write-Host -ForegroundColor Red
#}



