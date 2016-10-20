

$fileIn = 'C:\Users\DR25396\Desktop\new11.txt'
$fileOut = 'C:\Users\DR25396\Desktop\new11b.txt'

(Get-Content $fileIn) | ForEach-Object { $_ -replace 'Guid' } > $fileOut
