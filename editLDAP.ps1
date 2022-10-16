$Contract = Read-Host -Prompt 'Contract'
$IP = Read-Host -Prompt 'LDAP IP'

$original_file = 'E:\IFS\TEXT.py'
$destination_path = New-Item -Path E:\IFS\new\$Contract -ItemType Directory
$temp_path = "E:\IFS\temp\"
if (Test-Path $temp_path) {
       Write-Host "TEMP Folder Exists"
}
else
{
    New-Item $temp_path -ItemType Directory
}
$destination_file =  'E:\IFS\temp\TEXT.py'
(Get-Content $original_file) | Foreach-Object {
    $_ -replace '<CONTRACT>', $Contract `
       -replace '<LDAP_SERVER_IP>', $IP `
    } | Set-Content $destination_file
Move-Item -Path 'E:\IFS\temp\*' -Destination E:\IFS\new\$Contract	
#$destination_path = 'E:\IFS\new\' + $folder_to_be_created