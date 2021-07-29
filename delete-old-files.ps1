$Folder = $args[0]
$Days = $args[1]

#Create log file
Set-Location ..
If (!(Test-Path -Path ..\deleteLog.txt -PathType Leaf)){
   New-Item -Path . -Name "deleteLog.txt" -ItemType "file"
} 

#Delete files older than x months (user cli args)
Get-ChildItem $Folder -Recurse -Force -ea 0 |
? {!$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-($Days))} |
ForEach-Object {
   $_ | del -Force
   if (!(Test-Path -Path $_.FullName -PathType Leaf)){
        Write-Host "Deleting item " + $_.FullName
        $_.FullName | Out-File .\deleteLog.txt -Append
   }
}

#Delete empty folders and subfolders
Get-ChildItem $Folder -Recurse -Force -ea 0 |
? {$_.PsIsContainer -eq $True} |
? {$_.getfiles().count -eq 0} |
ForEach-Object {
    $_ | del -Force
    if (!(Test-Path -Path $_.FullName -PathType Leaf)){
        Write-Host "Deleting item " + $_.FullName
        $_.FullName | Out-File .\deleteLog.txt -Append
   }

}
