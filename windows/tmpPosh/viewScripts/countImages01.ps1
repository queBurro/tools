cd D:\FATest\Messages\20150213.132651.833


#$logPath = "D:\FATest\Messages\"
#$lastLog = get-childitem $logPath | Sort CreationTime -Descending | -First 1 
#$test = "$logPath + $lastLog"
#echo $test


Get-ChildItem "Im*_*C2*.xml" | Measure-Object -Line
Get-ChildItem "Im*PV*_*C2*.xml" | Measure-Object -Line
Get-ChildItem "Im*TV*_*C2*.xml" | Measure-Object -Line

Get-ChildItem "Im*_*C1*.xml" | Measure-Object -Line
Get-ChildItem "Im*PV*_*C1*.xml" | Measure-Object -Line
Get-ChildItem "Im*TV*_*C1*.xml" | Measure-Object -Line


Get-ChildItem "Im*PV_E1*_*C1*.xml" | Measure-Object -Line
Get-ChildItem "Im*PV_E2*_*C1*.xml" | Measure-Object -Line
Get-ChildItem "Im*PV_E3*_*C1*.xml" | Measure-Object -Line
Get-ChildItem "Im*PV_E4*_*C1*.xml" | Measure-Object -Line

Get-ChildItem "Im*TV_E1*_*C1*.xml" | Measure-Object -Line
Get-ChildItem "Im*TV_E2*_*C1*.xml" | Measure-Object -Line
Get-ChildItem "Im*TV_E3*_*C1*.xml" | Measure-Object -Line
Get-ChildItem "Im*TV_E4*_*C1*.xml" | Measure-Object -Line
