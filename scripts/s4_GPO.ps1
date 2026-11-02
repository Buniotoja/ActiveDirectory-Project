Write-Host "At first prepare target's DistinguishedName and registry values."

$Path=Read-Host "Target"
$gpName=Read-Host "GPO's name"

New-GPO -Name $gpName
New-GPLink -Name $gpName -Target $Path

try{
Set-GPRegistryValue `
	-Name $gpName `
	-Key (Read-Host "Registry Key") `
	-ValueName (Read-Host "Value Name") `
	-Type (Read-Host "Type") `
	-Value ([int](Read-Host "Value"))
	}
catch{
	Write-Host "Operation failed. Error: $_"
	}
Write-Host "Successfull!"
