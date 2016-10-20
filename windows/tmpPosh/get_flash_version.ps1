[CmdletBinding()]  
   
 param(  
 $searchbase = $null,  
 $output = ".\get_flash_version_output.txt"  
 )  
   
 # if the searchbase isn't specified then use the default domain of the user  
 if($searchbase -eq $null)  
 {  
   $searchbase = ([adsi]'').distinguishedName.ToString()  
 }  
   
 #load all computer objects into a variable  
 $computers = Get-ADComputer -SearchBase $searchbase -Filter * -SearchScope Subtree  
   
 #iterate through each computer object  
 foreach($computer in $computers)  
 {  
   $name = $computer.name  
   
   # test to be sure you can communicate with the machine, ignoring any errors  
   if(Test-Connection $name -count 1 -ErrorAction SilentlyContinue)  
   {  
     # file that we will be querying for the version  
     $filename = "\\$name\c$\windows\system32\macromed\flash\flash*.ocx"  
       
     # test the path to be sure it exists before trying to check the version  
     if(Test-Path $filename)  
     {  
       $file = get-item $filename  
       $version = $file.versionInfo.fileversion -replace ",", "."  
     }  
     else  
     {  
       $version = "Not Installed"  
     }  
     write-verbose "$name`t$version"  
     "$name`t$version" | out-file -append $output  
   }  
   else  
   {  
     write-verbose "$name`tOffline"  
     "$name`tOffline" | out-file -Append $output  
   }  
 } 