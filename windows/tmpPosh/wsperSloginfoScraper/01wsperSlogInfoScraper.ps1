<#
.SYNPOSIS
scrapes the 3 wsper hosts for errors and adds them to the windows log
.DESCRIPTION
wsper scraper
.EXAMPLE
example 1
.EXAMPLE
another example
#>


#http://stackoverflow.com/questions/20180201/create-a-process-using-plink-in-powershell-and-sending-commands-to-it


function plink
{
  [CmdletBinding()]
  PARAM
  (
    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [string] $remoteHost,

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [string] $login,

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [string] $passwd,

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [string] $command)

  & c:\putty\plink.exe -ssh $remoteHost -l $login -pw $passwd $command
  return
}



$command1 = "sloginfo -s 3 -w"
#$command2 = "cd /opt/compiere/apache-tomcat-6.0.32/bin && ./startWS.sh"
$command3 = "pwd" 

$login = "tracs"
$passwd = "aeat" #Read-Host "Enter Password for $login"


write-host "doing something trivial"-ForegroundColor DarkGreen
#plink -P 22 -batch -pw $passwd tracs@$remoteHost $command3 


$remoteHost = "172.17.10.101"
&c:\putty\plink.exe -P 22 -batch -pw $passwd $login@$remoteHost $command3
$remoteHost = "172.17.10.101"
&c:\putty\plink.exe -P 22 -batch -pw $passwd $login@$remoteHost $command3
$remoteHost = "172.17.10.101"
&c:\putty\plink.exe -P 22 -batch -pw $passwd $login@$remoteHost $command3 


//[System.Diagnostics.Debug]::Write("DR Vampire HELLLOOO")



#trace-command "qwerqweqwe"
#echo "hello" | trace-command "werwrwe3r"

