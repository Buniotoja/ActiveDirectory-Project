function Get-UserData () {
	$user=@{
		Name=Read-Host "Name"
		Surname=Read-Host "Surname"
		Group=Read-Host "Group"
	}
	return $user
}

$data=Get-UserData

New-ADUser -Name $data["Name"] `
	-SamAccountName $data["Name"] `
	-Surname $data["Surname"]
	-UserPrincipalName "$data['Name']@ADproject.local"
	-Path "OU=Users,DC=ADproject,DC=local" `
	-AccountPassword (Read-Host "Enter password" -AsSecureString) `
	-Enabled $true `
	-ChangePasswordAtLogon $true
	
Add-ADGroupMember -Identity $data["Group"] -Members $data["Name"]
	
