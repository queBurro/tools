  
Write-Host ( Get-ChildItem -Recurse "D:\FATest\Messages\" | Measure-Object ).Count;