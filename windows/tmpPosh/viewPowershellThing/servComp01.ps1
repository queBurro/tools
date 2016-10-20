
# | Out-File "C:\Users\DeltaRail Group\Desktop\Tim\runningServices\tmp.txt"

#I jsut want the differences
#Compare-Object -ReferenceObject $(get-content ".\orange.txt") -DifferenceObject (Get-Service | Where-Object -FilterScript {$_.status -eq "running" }) -Property name
#Compare-Object -ReferenceObject $(get-content ".\orange2.txt") -DifferenceObject (Get-Service | Where-Object {$_.status -eq "running" }    ) 

Compare-Object -ReferenceObject (Import-Clixml .\baselineServices.xml) -DifferenceObject (Get-Service | Where-Object {$_.status -eq "running" }) -Property name
