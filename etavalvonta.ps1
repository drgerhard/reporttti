param (
    [string]$Kone = "localhost"
)

# Ladataan yhteiset funktiot
. .\YhteisetFunktiot.ps1

try {
    if ($Kone -eq "localhost") {
        $tulos = [PSCustomObject]@{
            Aika = Get-Date
            Kone = $env:COMPUTERNAME
        }
    }
    else {
        $tulos = Invoke-Command -ComputerName $Kone -ScriptBlock {
            [PSCustomObject]@{
                Aika = Get-Date
                Kone = $env:COMPUTERNAME
            }
        }
    }

    # Kirjataan lokiin
    Kirjoita-Loki "$($tulos.Aika) $($tulos.Kone)"
}
catch {
    Kirjoita-Loki "Virhe etähallinnassa: $($_.Exception.Message)"
    Write-Host "Virhe: $($_.Exception.Message)"
}
