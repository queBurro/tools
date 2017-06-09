# run as admin?
# https://chocolatey.org/packages?q=shotty

set-executionpolicy remotesigned

iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install notepadplusplus.install -y
#choco install googlechrome -y
choco install 7zip.install -y
#choco install shotty -y
#choco install firefox -y
#choco install nmap -y
#mosquitto
#team foundation sidekicks 2013
#tfs administration tool
#choco install vlc -y
#choco install winmerge -y
#wix
#gittfs?

# choco install jdk8 

#git related
#choco install git -y
choco install git -params '"/GitAndUnixToolsOnPath"'
#choco install poshgit -y
choco install tortoisegit -y

#putty 
choco install putty -y
