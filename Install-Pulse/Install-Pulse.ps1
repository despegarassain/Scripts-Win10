$currentdirectory = split-path -parent $MyInvocation.MyCommand.Definition
Set-Location $currentdirectory
(Get-Location).Path
Function creadopor {
    Write-Output " _____________________________________________________________________________________________________"
    Write-Output ""
    Write-Output "                                 +++++++++++++++++++++++++++++++++++++++++++++++++"
    Write-Host "                                    Script Creado por Frank Diaz y Marcelo Assain                                " 
    Write-Output "                                 +++++++++++++++++++++++++++++++++++++++++++++++++"
    Write-Output ""
    Write-Output " _____________________________________________________________________________________________________"

}
function DownloadFilesInstaller {
    param (
        $1,$2
    )
    $Token = "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"

    $Headers = @{
    accept = "application/octet-stream"
    authorization = "Token " + $Token
    }

    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest -Uri $1 `
            -Headers $Headers -UseBasicParsing -OutFile "$currentdirectory\$2"
}

creadopor
#CCCC
mkdir "C:\ProgramData\Pulse Secure\ConnectionStore\"
Set-Content -Value “;`n`; C:\ProgramData\Pulse Secure\ConnectionStore\connstore.dat`n`; Wed Feb  2 12:37:59 2022`n`;`n`ive `"6249e847831138488f4f560b95690a10`" {`n`  connection-source: `"user`"`n`  friendly-name: `"VPN Miami`"`n`  uri: `"https://pulse-ar.despegar.net/DESP`"`n`}`n`ive `"6c108e3ff444c7499a4c7d487419872a`" {`n`  connection-source: `"user`"`n`  friendly-name: `"VPN Regional MX`"`n`  uri: `"http://pulse-mx.despegar.net/`"`n`}`n`ive `"78cbf4706cd03c4b96b5685be571ce9e`" {`n`  connection-source: `"user`"`n`friendly-name: `"VPN Regional BR`"`n`  uri: `"http://pulse-br.despegar.net/`"`n`}`n`ive `"8061dffb28c1294db0086381a5d8792d`" {`n`  connection-source: `"user`"`n` friendly-name: `"VPN Regional AR`"`n` uri: `"http://pulse-ar.despegar.net/`"`n`}`n`license `"evaluation`" {`n`  area-acceleration: `"false`"`n`  area-collaboration: `"false`"`n`  area-connectivity: `"false`"`n`  area-security: `"false`"`n`  expiration:`"0`"`n`  feature: `"integration`"`n`}`n` machine `"local`" {`n`  guid: `"E26506A704B241E99F4A422CB5309897`"`n`}`n`schema `"version`" {`n`  version: `"1`"`n`}`n` userdata `"6249e847831138488f4f560b95690a10`" {`n`}" -Path "C:\ProgramData\Pulse Secure\ConnectionStore\connstore.dat"
Write-Output " =========================== "
Write-Host "   Instalando VPN Miami   " -ForegroundColor Yellow -BackgroundColor Black
Write-Output " =========================== "

$URLinstaller = 'https://api.github.com/repos/despegar/Scripts-Win10/releases/assets/55127803'
$NameInstaller = 'PulseSecure.x64.msi'

DownloadFilesInstaller $URLinstaller $NameInstaller

Start-Process -Wait msiexec -ArgumentList "/i $currentdirectory\$NameInstaller /quiet /norestart"


Write-Output ""
Write-Output " ############# "
Write-Host "   Instalado   " -ForegroundColor Green -BackgroundColor Black
Write-Output " ############# "
Write-Output ""
Write-Output "_________________________________________________________________________________________"
Write-Output ""

Remove-Item $NameInstaller
pause
