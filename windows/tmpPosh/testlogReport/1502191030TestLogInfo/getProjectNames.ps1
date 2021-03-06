<#
.SYNPOSIS
queries 2 collectionsto see what projects have got Test logs in them
.DESCRIPTION
queries 2 collections .
.EXAMPLE
example 1
.EXAMPLE
another example
#>

$queryBase="
SELECT
[System.TeamProject]
FROM WorkItems
WHERE [System.WorkItemType] = 'Test Log'" 

$queryClassic=" and [System.TeamProject] <> 'z Dummy Project to play with' 
ORDER BY [System.TeamProject]"

$queryScalable=" and [System.TeamProject] <> 'Z Dummy Project to play with' 
and [System.TeamProject] <> 'Automation Test' 
and [System.TeamProject] <> 'zDummy2' 
and [System.TeamProject] <> 'zDummyProject02' 
ORDER BY [System.TeamProject]"


Clear-Host

#paths
$pathski=$MyInvocation.MyCommand.Path
$outfile=$pathski+"testLogInfo.tsv"
$xmlOutfile=$pathski+"testLogInfo.xml"


#query collection
echo "CLASSIC projects that have testlogs in them"
Get-Date
$coll="http://tfs:8080/tfs/IECC Classic Collection"
tfpt query /collection:$coll /wiql:$queryBase$queryClassic | Select-Object -unique

echo "SCALABLE..."
Get-Date
$coll="http://tfs:8080/tfs/IECCScalableCollection"
tfpt query /collection:$coll /wiql:$queryBase$queryScalable | Select-Object -unique





#pause 



