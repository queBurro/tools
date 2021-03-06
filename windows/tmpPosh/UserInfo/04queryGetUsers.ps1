<#
.SYNPOSIS
queries 2 collections ready for display by existing spreadhseet
.DESCRIPTION
queries 2 collections ready for display by existing spreadhseet.
.EXAMPLE
example 1
.EXAMPLE
another example
#>


function ShowInfo([string]$a)
{
    [string] $tmp = "########################### " + $a
    Write-Output $tmp
}

#ShowInfo "Specifying the path"
Set-Alias -Name tfsSec -Value 'C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\TFSSecurity.exe'

function GetUsersInCollection([string]$a)
{
    [string] $tmp = "info for: " + $a
    ShowInfo $tmp
    tfsSec /imx “Project Collection Administrators” /collection:$a
    ShowInfo "---"
}

function GetServerInfo([string]$a)
{
    ShowInfo $a
    #tfsSec /imx “Project Collection Valid Users” /collection:"$a" 
    ShowInfo "---"
}

Clear-Host

$dt = Get-Date -Format "yyMMddHHmmss"

#GetUsersInCollection http://tfs:8080/tfs/tfsrollout_collection

#ShowInfo "Done"

ShowInfo "Show info for:"
# .\TFSSecurity.exe /i “Project Collection Valid Users” /collection:"http://tfs:8080/tfs/IECCScalableCollection"
#tfsSec /imx "Team Foundation Administrators" /collection:"http://tfs:8080/tfs/tfsrollout_collection" /server:http://tfs2012test:8080/tfs

tfsSec /imx "Team Foundation Administrators" /server:http://tfs:8080/tfs > "C:\Users\DR25396\Documents\tmpPosh\UserInfo\$dt ServerAdminAccess.txt"

#GetUsersInCollection "http://tfs:8080/tfs/irma_Collection"

$outfile = "C:\Users\DR25396\Documents\tmpPosh\UserInfo\$dt CollectionAdminAccess.txt"


echo "starting..." > $outfile

$collectionArray = (
"http://tfs:8080/tfs/ARS_Plus_Collection",
"http://tfs:8080/tfs/Automation_Tools_Collection",
"http://tfs:8080/tfs/CCF_Collection",
"http://tfs:8080/tfs/CodeCoverage_Collection",
"http://tfs:8080/tfs/Common_Components_Collection",
"http://tfs:8080/tfs/ConfigurationManagement",
"http://tfs:8080/tfs/Data_Services_Collection",
"http://tfs:8080/tfs/DeltaRail_Common_Collection",
"http://tfs:8080/tfs/DeltaRailSolutions_Collection",
"http://tfs:8080/tfs/DummyIecc_Collection",
"http://tfs:8080/tfs/EnergyMonitoring_Collection",
"http://tfs:8080/tfs/Fishbone_Collection",
"http://tfs:8080/tfs/IChex_Collection",
"http://tfs:8080/tfs/IECC Classic Collection",
"http://tfs:8080/tfs/IECCScalableCollection",
"http://tfs:8080/tfs/IRMA_Collection",
"http://tfs:8080/tfs/IT Collection",
"http://tfs:8080/tfs/MechanicalInteractions_Collection",
"http://tfs:8080/tfs/OLIVE_Collection",
"http://tfs:8080/tfs/Panchex_Collection",
"http://tfs:8080/tfs/Pegasus_Collection",
"http://tfs:8080/tfs/RTS_Collection",
"http://tfs:8080/tfs/TCA_Collection",
"http://tfs:8080/tfs/TFSBuilds_Collection",
"http://tfs:8080/tfs/TFSRollOut_Collection",
"http://tfs:8080/tfs/Trackline2",
"http://tfs:8080/tfs/TTP_Collection",
"http://tfs:8080/tfs/VampireCollection",
"http://tfs:8080/tfs/VIEW_Collection",
"http://tfs:8080/tfs/VTE_Collection",
"http://tfs:8080/tfs/WheelChex_Collection",
"http://tfs:8080/tfs/WSPER_Collection",
"http://tfs:8080/tfs/XDM_Collection",
"http://tfs:8080/tfs/XVPlus_Collection"
)

ForEach($coll in $collectionArray)
{
#    GetUsersInCollection $coll >> $outfile
   echo "users in here $coll"
   tfsSec /imx "Project Collection Administrators" /collection:"$coll"
}


