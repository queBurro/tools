
Write-Output "Script to periodically clear stores for soak test"

while(1) 
{ 
    sleep -sec 86400

    Write-Output "clearing Stores..."
    Remove-Item D:\Store\*
    Remove-Item E:\Store\*
    Write-Output "Stored cleared."
}

#86400 24 hours

