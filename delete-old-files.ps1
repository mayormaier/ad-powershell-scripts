$Folder = $args[0]
$Days = $args[1]

#Delete files older than x months (user cli args)
Get-ChildItem $Folder -Recurse -Force -ea 0 |
? {!$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays($Days)} |
ForEach-Object {
   $_ | del -Force
   Write-Host "Deleting item " + $_.FullName
}

#Delete empty folders and subfolders
Get-ChildItem $Folder -Recurse -Force -ea 0 |
? {$_.PsIsContainer -eq $True} |
? {$_.getfiles().count -eq 0} |
ForEach-Object {
    $_ | del -Force
    Write-Host "Deleting item " + $_.FullName
}