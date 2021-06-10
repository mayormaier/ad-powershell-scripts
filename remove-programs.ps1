#Import-Module hsg*6

$programs=Get-Content C:\users\nst\Desktop\uninstallprog.txt

ForEach ($prog in $programs)

{
Write-Host "uninstalling $($prog)..."

$application = Get-WmiObject -Class Win32_Product -Filter "Name LIKE '%$($prog)%'"
$application.Uninstall() 

if ($?) {Write-Host "uninstall of $($prog) succeeded"}
}
