$OUs=@("OrganizationalUnit_1", "OrganizationalUnit_2");

foreach ($i in $OUs) {
	try {
		New-ADOrganizationalUnit -Name $i -Path "DC=ADproject,DC=local" -ErrorAction Stop;
		}
	catch {
		"Failed: $i"
		$_.Exception.Message}
	}

