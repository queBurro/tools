


$limit = (Get-Date).AddDays(-2)
$path = "F:\BKUP"
$path = "C:\Users\DR25396\Documents\tmpPosh\BKUP\"

# Delete files older than the $limit.
Get-ChildItem -Path $path *.log -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force

