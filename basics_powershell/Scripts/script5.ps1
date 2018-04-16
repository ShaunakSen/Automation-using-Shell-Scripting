$parseURL = 'https://www.reddit.com/r/PowerShell/'
$webRequest = Invoke-WebRequest -Uri $parseURL

$webRequest

$webRequest | Get-Member

$webRequest.ParsedHtml.getElementsByTagName('p') | Where-Object {$_.ClassName -eq 'title'}
$webRequest.ParsedHtml.getElementsByTagName('p') | Where-Object {$_.ClassName -eq 'title'} | Select-Object -ExpandProperty OuterText