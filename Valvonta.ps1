param (
    [Parameter(Mandatory = $true)]
    [string]$Kansio
)

# Ladataan yhteiset funktiot
. "$PSScriptRoot\Yhteisetfunktiot.ps1"

try {
    Kirjoita-Loki "[INFO] Valvonta aloitettu kansiolle: $Kansio"

    if (-not (Test-Path $Kansio)) {
        throw "Kansiota ei löydy: $Kansio"
    }

    Kirjoita-Loki "[INFO] Kansio löytyi"

    $maara = (Get-ChildItem $Kansio -File).Count
    Kirjoita-Loki "[INFO] Tiedostojen määrä: $maara"

    exit 0
}
catch {
    Kirjoita-Loki "[ERROR] $_"
    exit 1
}
