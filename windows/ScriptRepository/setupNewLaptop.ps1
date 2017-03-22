#run scripts as admin, as we're installing...

#query packages here: https://chocolatey.org/packages?q=flex

#allow scripts to run
set-executionpolicy remotesigned

#enable ps remoting
Enable-PSRemoting -Force

#install chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#installs 64bit version which doesn't have plugin manager
choco install notepadplusplus.install 7zip.install firefox filezilla xmlnotepad -y 

#scm related
choco install git poshgit tortoisegit tortoisesvn ankhsvn -y

#Microsoft related
#invoke-command -ComputerName  FA0033194 -ScriptBlock { choco install sql-server-management-studio -y }
choco install sql-server-management-studio visualstudio2015professional -y 
 
#manual installs:
	#manually install vs2005, plus patches
	#install Flex manually / needs licence
	#install Subclipse (for Flex) manually. See: http://stackoverflow.com/questions/2108351/subclipse-installation-in-flex-builder-3
	#needs manual chrome install, as #choco install googlechrome -y doesn't work

	
#optional installs:
	#choco install putty shotty nmap vlc winmerge -y	
	
	#team foundation sidekicks 2013
	#tfs administration tool

	#mosquitto	
	#wix

	# choco install jdk8 
	# choco install jdk7

