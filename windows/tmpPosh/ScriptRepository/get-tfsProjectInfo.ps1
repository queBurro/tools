Add-Type -AssemblyName "Microsoft.TeamFoundation.Client, Version=12.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"

$uri = "http://syntfs02:8080/tfs"
$tfsConfigurationServer = [Microsoft.TeamFoundation.Client.TfsConfigurationServerFactory]::GetConfigurationServer($uri)
$tpcService = $tfsConfigurationServer.GetService("Microsoft.TeamFoundation.Framework.Client.ITeamProjectCollectionService")

$sortedCollections = $tpcService.GetCollections() | Sort-Object -Property Name
$numberOfProjects = 0

foreach($collection in $sortedCollections) {
    $collectionUri = $uri + "/" + $collection.Name
    $tfsTeamProject = [Microsoft.TeamFoundation.Client.TfsTeamProjectCollectionFactory]::GetTeamProjectCollection($collectionUri)
    $cssService = $tfsTeamProject.GetService("Microsoft.TeamFoundation.Server.ICommonStructureService3")   
    $sortedProjects = $cssService.ListProjects() | Sort-Object -Property Name

    Write-Host $collection.Name "- contains" $sortedProjects.Count "project(s)"

    foreach($project in $sortedProjects)
    {
        $numberOfProjects++
        Write-Host (" - " + $project.Name)
    }
}

Write-Host
Write-Host "Total number of project collections" $sortedCollections.Count
Write-Host "Total number of projects           " $numberOfProjects

#from: https://www.visualstudio.com/en-us/docs/integrate/api/git/repositories
#get the following:  http://syntfs02:8080/tfs/DefaultCollection/_apis/git/repositories?api-version=1.0
#http://syntfs02:8080/tfs/DefaultCollection/_apis/projects?api-version=2.0
#Invoke-WebRequest -Uri http://syntfs02:8080/tfs/DefaultCollection/_apis/git/repositories?api-version=2.0

#from: https://blogs.technet.microsoft.com/heyscriptingguy/2015/10/08/playing-with-json-and-powershell/ 
$request = 'http://musicbrainz.org/ws/2/artist/5b11f4ce-a62d-471e-81fc-a69a8278c7da?inc=aliases&fmt=json'

#Invoke-WebRequest $request

Invoke-WebRequest $request |
  ConvertFrom-Json | 
  #select -ExpandProperty country | 
  select name, country, disambiguation

echo "hello"
$cred = Get-Credential

$request = 'http://syntfs02:8080/tfs/DefaultCollection/_apis/git/repositories?api-version=2.0'
  Invoke-WebRequest $request -Credential $cred

echo "hello again"
  Invoke-WebRequest $request -UseDefaultCredentials