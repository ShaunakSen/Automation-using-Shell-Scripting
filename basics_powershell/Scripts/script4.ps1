$downloadURL = 'http://www.anubandh.com/'
$downloadRequest = Invoke-WebRequest -Uri $downloadURL
$downloadRequest
$downloadRequest.Links

$downloadRequest.Links | Where-Object {$_ -like '*Sujit*' -and $_ -like '*Tangadp*'}


$downloadURL2 = 'http://hall2mess.esy.es/'

$downloadRequest2 = Invoke-WebRequest -Uri $downloadURL2

$downloadRequest2

$downloadLink = 'http://hall2mess.esy.es/uploads/menu/menu.png'

$fileName = $downloadLink.Substring($downloadLink.LastIndexOf('/') + 1)

$fileName

$downloadRequest_for_download = Invoke-WebRequest -Uri $downloadLink

$fileContents = $downloadRequest_for_download.Content

[io.file]::WriteAllBytes("C:\Users\Shaunak\Downloads\$fileName",$fileContents)










