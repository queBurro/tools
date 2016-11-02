# run as admin?
# https://chocolatey.org/packages?q=shotty

set-executionpolicy remotesigned

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install notepadplusplus.install 
choco install googlechrome
choco install 7zip.install 
choco install shotty
choco install firefox
choco install nmap
#mosquitto
#team foundation sidekicks 2013
#tfs administration tool
choco install vlc
choco install winmerge
#wix
#gittfs?

# choco install jdk8 
