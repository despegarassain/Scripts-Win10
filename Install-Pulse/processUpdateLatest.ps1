$currentdirectory = split-path -parent $MyInvocation.MyCommand.Definition
Set-Location $currentdirectory
(Get-Location).Path
Function creadopor {
    Write-Output " _____________________________________________________________________________________________________"
    Write-Output ""
    Write-Output "                                  ++++++++++++++++++++++++++++++++++++"
    Write-Host "                                   Script Creado por Marcelo Assain                                  " 
    Write-Output "                                  ++++++++++++++++++++++++++++++++++++"
    Write-Output ""
    Write-Output " _____________________________________________________________________________________________________"

}
function DownloadMotor {

    param(
        $1,$2,$3
    )
    
    $Token = "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"
    
    $Headers = @{
    accept = "application/octet-stream"
    authorization = "Token " + $Token
    }

    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest -Uri $1 -Headers $Headers -UseBasicParsing -OutFile $currentdirectory\$2
    $ProgressPreference = 'Continue'
    Expand-Archive $2 -DestinationPath $3 -Force

    # Verificacion de Descarga
    
    $NameFolder = Write-Output $3 | ForEach-Object{ $_.Split('\')[1]; }
    $NameFolder2 = (Get-ChildItem -Path Downloads -Force -Filter $NameFolder).Name

    if ( $NameFolder -eq $NameFolder2 ){
        Write-Host " Descarga OK "
    }else{
        Write-Host " Descarga Fallo " 
    }
    
}
function DownloadUserDespegar {
    
    Write-Output ""
    Write-Output " ---------------------------------------------------------------- "
    Write-Host "  Descargando todos los Files necesarios, por favor Espere . . .  " -ForegroundColor Yellow -BackgroundColor Black
    Write-Output " ---------------------------------------------------------------- "
    Write-Output ""
    DownloadMotor "https://api.github.com/repos/despegar/Scripts-Win10/releases/assets/54285358" "Downloads\DisableOREnable.zip" "Downloads\DisableOREnable"
    ### actualizar por PULSE
}
Function pulse {
    Write-Output ""
    Write-Output " ===================================="
    Write-Host "   Installing Pulse Wait . . .   " -ForegroundColor Yellow -BackgroundColor Black
    Write-Output " ===================================="
    Write-Output ""

    #& rundll32.exe dfshim.dll, ShOpenVerbApplication https://despegar.teleperformance.co/spop/Install/TPSPOPDespegar.application

    #Start-Process -Wait rundll32.exe -ArgumentList "dfshim.dll,ShOpenVerbApplication https://despegar.teleperformance.co/spop/Install/TPSPOPDespegar.application"

    Start-Process Downloads\ScreenPop\install.vbs ### PULSE

    #Start-Process -FilePath .\Downloads\ScreenPop\TPSPOPDespegar.application
}
Function disableall {
    
    Start-Process -Wait -FilePath Downloads\DisableOREnable\Stop.bat
}
Function enableall {
    
    Start-Process -Wait -FilePath Downloads\DisableOREnable\Start.bat
}
Function DownloadPS {

    $Token = "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"
    
    $URI = "https://api.github.com/repos/despegar/Scripts-Win10/releases/assets/54285391"

    $Headers = @{
    accept = "application/octet-stream"
    authorization = "Token " + $Token
    }

    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest -Uri $URI -Headers $Headers -OutFile $currentdirectory\Downloads\PS.zip
    Expand-Archive Downloads\PS.zip -DestinationPath Downloads\ -Force
}
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
## Aca arranca la ejecución
creadopor
pulse
AutoDeleteNow
Pause
$Result = [System.Environment]::Exitcode
[System.Environment]::Exit($Result)
Write-Output ""