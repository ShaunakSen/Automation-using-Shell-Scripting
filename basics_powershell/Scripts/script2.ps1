function Invoke-SuperAdvancedFunctionality {
[cmdletbinding()]
param()

    Write-Verbose "This function has now graduated!"

    # Write-Host example

    Write-Host "`nThis is an example of Write-Host!" -ForegroundColor White -BackgroundColor DarkBlue

    $processes = Get-Process

    Write-Debug "`$processes contains $($processes.Count) processes"

}

Invoke-SuperAdvancedFunctionality -Verbose


function Get-WMIInfo {
    [cmdletbinding()]
    param(
    [parameter(Mandatory=$true)]
    [string]
    $lookup,
    [parameter(Mandatory=$false)]
    [double]
    $version,
    [parameter(Mandatory=$false)]
    [int]
    $typeNumber
    )

    Write-Debug "[$lookup] reference requested."

    }


    # ForEach loop Object example

    $i = 1

    Get-Process | ForEach-Object {
    
        Write-Host "Process[$i]'s name is ($_.Name)"
        $i++
    }


    # For lopp example

    for($i=1; $i -le 15; $i++){
    
        Write-Host "This is the color for [$i]" -ForegroundColor $i

    }









