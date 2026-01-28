function Kirjoita-Loki {
    param (
        [string]$Viesti,
        [string]$Tiedosto = "Loki.txt"
    )

    $Aika = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$Aika - $Viesti" | Out-File -FilePath $Tiedosto -Append -Encoding UTF8
}
