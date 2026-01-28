#Lataa yhteiset funktiot käyttöön.

. .\Yhteisetfunktiot.ps1

try {
	$asema = Get-PSDrive C
	$vapaa = [math]::Round($asema.Free / 1GB, 2)
	Kirjoita-Loki "C:-asemalla vapaata tilaa: $vapaa GB"

}
catch{
	Kirjoita-Loki "Virhe levytlian tarkastuksessa: $($_.Exeption.Message)"
	Write-Host "Virhe: $($_.Expeption.message)"

}