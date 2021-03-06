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

$query02="
SELECT
[System.TeamProject], [System.Id], [DeltaRail.PlaceOrControlCentre], [DeltaRail.SchemeOrProject], [DeltaRail.WorkSite], [DeltaRail.TestlogCurrent], [DeltaRail.MasterTestCertNum], [DeltaRail.ActionBy], [DeltaRail.NameTester], 
[DeltaRail.DateRaised], [System.Title], [Microsoft.VSTS.CMMI.Symptom], [DeltaRail.DesignVersion], [DeltaRail.ProductVersion], [DeltaRail.TestlogPrevious], [Microsoft.VSTS.Common.ResolvedReason], [DeltaRail.NameResponse], 
[DeltaRail.DesignNewVersion], [DeltaRail.ProductNewVersion], [DeltaRail.DesignModNum], [DeltaRail.PositionRole], [Microsoft.VSTS.CMMI.ProposedFix], [DeltaRail.DateReturned], [DeltaRail.NameRetest], [DeltaRail.TLRetestComments], 
[DeltaRail.DateClosed], [DeltaRail.DateReviewed], [DeltaRail.AssessmentRequired], [DeltaRail.TLImplications], [System.Reason], [DeltaRail.TIC], [DeltaRail.TLRetestExtent], [System.State], [Microsoft.VSTS.Common.ClosedBy], 
[DeltaRail.TLAssesssmentCompetence], [DeltaRail.TestlogNext], [DeltaRail.NameAssessor], [DeltaRail.DateAssessment], [DeltaRail.Area], [DeltaRail.Iteration], [Microsoft.VSTS.CMMI.RootCause], [DeltaRail.RootCauseSpecify]
FROM WorkItems 
WHERE [System.WorkItemType] = 'Test Log' and [System.TeamProject] = 'Z Dummy Project to play with'
ORDER BY [System.TeamProject]"

#paths
$pathski=$MyInvocation.MyCommand.Path
$outfile=$pathski+"testLogInfo.tsv"
$xmlOutfile=$pathski+"testLogInfo.xml"

echo $outfile

#add the header
#tfpt query /collection:$coll /wiql:$query02 /include:header /format:tsv | Out-File $outfile
#echo '' >> $outfile


#query collection
echo "running 1/2 query... (might take 1 min)."
$coll="http://tfs:8080/tfs/IECCScalableCollection"
tfpt query /collection:$coll /wiql:$query02 /include:data /format:xml > $xmlOutfile



#echo "processing the output... (might take ~6 mins)"
#strip the characters we don't want
#$x=(get-content $xmlOutfile )
#$x  -replace( "\<\?xml version=.*")  -replace (" />", "`t") -replace ('"', "")  -replace (".*<WorkItems>")  -replace (".*<WorkItem.*>") -replace (".*<Fields>") -replace (".*<Field.*Value=") -replace ('</WorkItems>') -replace ('</WorkItem>')  -replace (".*<Field.*Value=") -replace ('</WorkItems>') -replace ('^  ', '')  >> $outfile


#$text = [IO.File]::ReadAllText($outfile) -replace ("`r`n", "") -replace ("</Fields>", "`r`n") 
#[IO.File]::WriteAllText($outfile, $text)


echo "done"


