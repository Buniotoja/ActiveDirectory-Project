Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools;

$domain_name=Read-Host "Domain Name";
$domain_admin_pass=Read-Host -AsSecureString "Password";

Install-ADDSForest -DomainName "$domain_name.local" -DomainNetbiosName $domainName -SafeModeAdministratorPassword $domain_admin_pass -InstallDNS -Force;

