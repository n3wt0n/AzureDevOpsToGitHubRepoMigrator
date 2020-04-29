Write-Host 'AZURE DEVOPS PARAMS'
$AzDOPAT = Read-Host 'Insert Azure DevOps PAT'
$AzDOOrg = Read-Host 'Insert Azure DevOps Organization name'
$AzDOPrj = Read-Host 'Insert Azure DevOps Project name'
$AzDORepo = Read-Host 'Insert Azure DevOps Repo name'
Write-Host ' '
Write-Host 'GITHUB PARAMS'
$GHPAT = Read-Host 'Insert GitHub PAT'
$GHUser = Read-Host 'Insert GitHub Username or Organization name'
$GHRepo = Read-Host 'Insert GitHub Repo name'

& "$PSScriptRoot\migrate.ps1" -AzDOPAT $AzDOPAT -AzDOOrg $AzDOOrg -AzDOPrj $AzDOPrj -AzDORepo $AzDORepo -GHPAT $GHPAT -GHUser $GHUser -GHRepo $GHRepo -Verbose