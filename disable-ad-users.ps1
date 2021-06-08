Import-Module ActiveDirectory
$users=Get-Content C:\users\nst\Desktop\disableusers.txt
$time=Get-Date

ForEach ($user in $users)

{

Disable-ADAccount -Identity $user

Set-ADObject -Identity $user -Description "disabled $($time)"

$userDN=(Get-ADUser $users).DistinguishedName

#Get-ADUser -Identity $userDN | Move-ADObject -TargetPath "OU=Disabled Users,OU=SBSUsers,OU=Users,OU=MyBusiness,DC=Marone,DC=local"

write-host "user $($user) has been disabled on $($time)"

}
