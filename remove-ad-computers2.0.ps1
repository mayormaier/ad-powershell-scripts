$comps=Get-Content C:\users\nst\Desktop\deletecomputers.txt 

ForEach ($comp in $comps)
{



}
% { Get-ADComputer -Filter { Name -eq $_ } } | Remove-ADObject -Recursive