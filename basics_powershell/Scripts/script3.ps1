function Write-Pretty {

    [cmdletbinding()]
    param(
    [Parameter(
        Mandatory = $True,
        ValueFromPipeline = $True
    )]
    [Alias('Text')]
    $prettyText,
    [Parameter(
        Mandatory = $False)]
    [Alias('Type')]
    $textType
    )

    Begin {
        #Create a space before the text is displayed
        Write-Host `n
    }
    Process {
        # Begin process for Write-Pretty function

        # Write-Host $prettyText

        foreach ($textItem in $prettyText){
            
            Switch ($textType){
                {$_ -eq 'Random'} {
                    Write-Host -NoNewline "[" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15) 
                    Write-Host -NoNewline "R" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15)
                    Write-Host -NoNewline "andom" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15)
                    Write-Host -NoNewline "]" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15)

                    # Split the text into an array, split by spaces. (Also turns it into a string before the split).
                    # We needed to turn it into a string in case the type wasn't string when it was received.
                    # Or else the .Split() method wouldn't work

                    $writeText = $textItem.ToString().Split(' ')

                    foreach ($text in $writeText){
                        Write-Host -NoNewLine " $text" -ForegroundColor $(Get-Random -Minimum 1 -Maximum 15)

                    }

                    Write-Host `n
                
                }

                {$_ -eq 'Error'}{
                
                    Write-Host -NoNewline "[" -ForegroundColor White 
                    Write-Host -NoNewline "Error" -ForegroundColor Red -BackgroundColor DarkBlue
                    Write-Host -NoNewline "]" -ForegroundColor White 
                    Write-Host " $textItem" -ForegroundColor Red 
                
                }

                {$_ -eq 'Warning'}{
                
                    Write-Host -NoNewline "[" -ForegroundColor White 
                    Write-Host -NoNewline "Warning" -ForegroundColor Red -BackgroundColor DarkBlue
                    Write-Host -NoNewline "]" -ForegroundColor White 
                    Write-Host " $textItem" -ForegroundColor Yellow 
                
                }

                {$_ -eq 'Info' -or $_ -eq $null}{
                
                    Write-Host -NoNewline "[" -ForegroundColor White 
                    Write-Host -NoNewline "Info" -ForegroundColor Red -BackgroundColor DarkBlue
                    Write-Host -NoNewline "]" -ForegroundColor White 
                    Write-Host " $textItem" -ForegroundColor White 

                }

                Default {
                
                    Write-Host $textItem

                }
            
            }

        }
    }

    End {
        
        Write-Host `n
        
    }

}

Write-Pretty  -Text 'ok here we go' -Type Random