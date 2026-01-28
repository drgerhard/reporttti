Invoke-Command -ComputerName localhost -ScriptBlock {
	Get-Date
}



$koneet = @("PC1", "PC2", "PC3", "PC4", "PC5")

Invoke-Command -ComputerName $koneet -ScriptBlock {
	hostname
	Get-Date
	. .\levytilan-tarkastus.ps1
	
}