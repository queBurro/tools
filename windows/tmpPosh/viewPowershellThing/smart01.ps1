


cls


Get-WmiObject -namespace root\wmi -class MSStorageDriver_FailurePredictStatus | select-object InstanceName,PredictFailure,Reason |ft -a


Get-WmiObject -Namespace root\wmi -Class MSStorageDriver_FailurePredictStatus -Verbose
Write-Output "zzzzzzzz -----------------------------------------------------------------------------"
Get-WmiObject -Namespace root\wmi -Class MSStorageDriver_FailurePredictThresholds
Write-Output "ssssssssssssss ------------------------------------------------------------------------"
Get-WmiObject -Namespace root\wmi -Class MSStorageDriver_FailurePredictData

