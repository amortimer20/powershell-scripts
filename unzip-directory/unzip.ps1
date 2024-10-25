$CurrentDirectory = Get-Location
$ZipFiles = Get-ChildItem -Path $CurrentDirectory -Filter *.zip

foreach ($Zip in $ZipFiles) {
    Write-Output "Unzipping $($Zip.Name)"
    Expand-Archive -Path $Zip.FullName -DestinationPath $CurrentDirectory
}