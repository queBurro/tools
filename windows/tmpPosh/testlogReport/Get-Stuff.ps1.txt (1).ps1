<#
.SYNPOSIS
get stuff - this is the default template I should be using
.DESCRIPTION
defaults to localhost
.EXAMPLE
ewrwe
.EXAMPLE
example 2
[string]$computerName = 'localhost'   <- default 
#>
[CmdletBinding()]
param (
[Parameter(Mandatory=$true)][string]$computerName
)

$os = Get-WmiObject -class win32_OperatingSystem -ComputerName $computerName
$bios = Get-WmiObject -class win32_BIOS -ComputerName $computerName

# don't comment, use write-verbose
Write-Verbose "building proprty list" 
Write-Debug "Computer name is $computerName"
$props = @{'computerName' = $computerName;
'OSVersion' = $os.version;
'BIOSSerial'=$bios.serialnumber}

$obj = New-Object -TypeName PSObject -Property $props

Write-Output $obj