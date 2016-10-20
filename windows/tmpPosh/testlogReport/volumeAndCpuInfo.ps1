
# Get-WmiObject -query "Select * from Win32_Volume" | Where-Object {$_.driveType -eq 3}

#Get-WmiObject -query "Select * from win32_processor" 
#Get-WmiObject win32_processor -Namespace "\\root\cimv2"

Get-WmiObject -Class win32_processor -Namespace "root\cimv2" | Select-Object Name

gwmi -query "select * from Win32_PerfFormattedData_PerfOS_Processor" | Where-Object  {$_.Name -ne '_Total'} | Select-Object Name, PercentProcessorTime

