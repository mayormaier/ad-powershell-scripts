Import-Module ActiveDirectory
$comps=Get-Content C:\users\nst\Desktop\disablecomputers.txt
$time=Get-Date
#$targetOU="OU=Disabled Computers,OU=SBSComputers,OU=Computers,OU=MyBusiness,DC=Marone,DC=local"
 

ForEach ($comp in $comps)
{

if ($comp.Trim()) {

    Get-ADComputer $comp.Trim() | Disable-ADAccount #-PassThru | Move-ADObject -TargetPath $targetOU
    
    }

Set-ADComputer -Identity $comp -Description "disabled on $($time)"

write-host "computer $($comp) has been disabled on $($time)"

}
