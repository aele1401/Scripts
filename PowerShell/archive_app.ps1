$sourcePath = "C:\Source\MyApp"
$destinationPath = "C:\Packages\MyApp.zip"
Compress-Archive -Path $sourcePath -DestinationPath $destinationPath
