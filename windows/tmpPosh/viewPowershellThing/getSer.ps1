Get-Service| Where-Object -FilterScript {$_.status -eq "running" }  | Select-Object -Property Name > orange2.txt

#