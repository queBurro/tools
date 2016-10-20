<#
.SYNPOSIS
gets user info of who's logged on to irma DBs
.DESCRIPTION
queries 2 collections ready for display by existing spreadhseet.
.EXAMPLE
example 1
.EXAMPLE
another example
#>


clear

$collectionArray = (“irmaora11”,“irmatstdb”,“IrmaSQL14”)


ForEach($server in $collectionArray)
{
#    GetUsersInCollection $coll >> $outfile
Write-Output "info for: $server"
Get-WmiObject Win32_LoggedOnUser -ComputerName $server | Select Antecedent -Unique
}




#ForEach($server in $collectionArray)
{
#$server = “IrmaSQL14”
#$username = $env:USERNAME

#$session = ((quser /server:$server | ? { $_ -match $username }) -split ' +')[2]
#echo $session
#logoff $session /server:$server
}



#Write-Output $server
#$username = $env:USERNAME
#$session = ((quser /server:$server | ? { $_ -match $username }) -split ' +')[2]
#echo $env:USERNAME
#echo $session