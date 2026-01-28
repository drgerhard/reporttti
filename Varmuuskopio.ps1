
# =========================
# VARMUUSKOPIO.PS1
# =========================

# Ladataan yhteiset funktiot
. "$PSScriptRoot\Yhteisetfunktiot.ps1"

param (
    [Parameter(Mandatory = $true)]
    [string]$Lahde,

    [Parameter(Mandatory = $true)]
    [string]$Kohde
)

Clear-Host

try {
    Kirjoita-Loki "[INFO] Varmuuskopiointi aloitettu"
    Kirjoita-Loki "[INFO] Lähdekansio: $Lahde"
    Kirjoita-Loki "[INFO] Kohdekansio: $Kohde"

    if (-not (Test-Path $Lahde)) {
        throw "Lähdekansiota ei löydy: $Lahde"
    }

    if (-not (Test-Path $Kohde)) {
        New-Item -ItemType Directory -Path $Kohde | Out-Null
        Kirjoita-Loki "[INFO] Luotiin kohdekansio: $Kohde"
    }

    # Kopioidaan kaikki tiedostot ja alikansiot
    Copy-Item -Path "$Lahde\*" -Destination $Kohde -Recurse -Force
    Kirjoita-Loki "[INFO] Kopiointi valmis: $Lahde -> $Kohde"

    Write-Host "`nVarmuuskopiointi valmis!" -ForegroundColor Green
    Write-Host "Lähde : $Lahde"
    Write-Host "Kohde : $Kohde"
    exit 0
}
catch {
    Kirjoita-Loki "[ERROR] $_"
    Write-Host "Virhe varmuuskopioinnissa: $_" -ForegroundColor Red
    exit 1
}
