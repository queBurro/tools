# run as admin

set-executionpolicy remotesigned

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install notepadplusplus.install 
choco install googlechrome
choco install 7zip.install 

# choco install jdk8 
