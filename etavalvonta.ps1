param (
    [string]$Kone = "localhost"
)

# Ladataan yhteiset funktiot
. .\YhteisetFunktiot.ps1

try {
    # Ajetaan komento etänä (tai lokaalisti jos localhost)
    $tulos = Invoke-Command -ComputerName $Kone -ScriptBlock {
        [PSCustomObject]@{
            Aika  = Get-Date
            Kone  = $env:COMPUTERNAME
        }
    }

    # Lokitiedoston polku
    $Loki = "C:\Tyokalupakki\Etavalvonta.log"

    # Kirjataan lokiin
    $tulos | ForEach-Object {
        "$($_.Aika) - $($_.Kone)" | Out-File -FilePath $Loki -Append -Encoding utf8
    }
}
catch {
    "Virhe koneessa $Kone : $_" | Out-File -FilePath "C:\Tyokalupakki\Etavalvonta_error.log" -Append
}
