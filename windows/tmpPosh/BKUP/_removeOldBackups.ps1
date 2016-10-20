
$limit = (Get-Date).AddDays(-2)
$path = "C:\Users\DR25396\Documents\tmpPosh\BKUP"

# Delete bak files older than the $limit.
Get-ChildItem -Path $path *.bak -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force
Get-ChildItem -Path $path *.trn -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force