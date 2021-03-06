# Script to force the .NET Framework optimization service to run at maximum speed.

$isWin8Plus = [Environment]::OSVersion.Version -ge (new-object 'Version' 6,2)
$dotnetDir = [environment]::GetEnvironmentVariable("windir","Machine") + "\Microsoft.NET\Framework"
$dotnet2 = "v2.0.50727"
$dotnet4 = "v4.0.30319"

$dotnetVersion = if (Test-Path ($dotnetDir + "\" + $dotnet4 + "\ngen.exe")) {$dotnet4} else {$dotnet2}


echo $dotnetVersion 

$ngen32 = $dotnetDir + "\" + $dotnetVersion +"\ngen.exe"
$ngen64 = $dotnetDir + "64\" + $dotnetVersion +"\ngen.exe"

echo $ngen64

cd C:\Windows\Microsoft.NET\Framework64\v4.0.30319
.\ngen.exe queue status

pause


