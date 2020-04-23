Param(
    [Parameter( Mandatory = $true)]
    $AzDOPAT, 
    [Parameter( Mandatory = $true)]
    $AzDOOrg,
    [Parameter( Mandatory = $true)]
    $AzDOPrj,
    [Parameter( Mandatory = $true)]
    $AzDORepo,
    [Parameter( Mandatory = $true)]
    $GHPAT,
    [Parameter( Mandatory = $true)]
    $GHUser,
    [Parameter( Mandatory = $true)]
    $GHRepo
)

Write-Verbose "STARTING MIRROR MIGRATION FROM $AzDOOrg/$AzDOPrj/$AzDORepo to $GHUser/$GHRepo"

# STEP 1: Make sure you have a local copy of all "old repo", branches and tags
Write-Verbose 'Cloning Source Repo...'

if ( -not (Test-Path -LiteralPath '/migration' -PathType Container) )
{
    # This means we didn't mount an external volume
    Set-Location /

    mkdir migration
}

Set-Location migration

$migrationFolder = "$AzDORepo-Migration"

mkdir $migrationFolder

Set-Location $migrationFolder

$cloneUrl = "https://$AzDOPAT@dev.azure.com/$AzDOOrg/$AzDOPrj/_git/$AzDORepo"

git clone --miror $cloneUrl .

# STEP 2: Add a "new repo" as a new remote origin:

Write-Verbose 'Adding Target Repo as Origin'

$GHoriginUrl = "https://github.com/$GHUser/$GHRepo.git"

git remote add GHorigin $GHoriginUrl

# STEP 3: Push everything to the new repo.

Write-Verbose 'Pushing all code, branches, tags, and history to Target Repo...'

$GHpushUrl = "https://$GHPAT@github.com/$GHUser/$GHRepo.git"

git push --mirror $GHpushUrl

# STEP 4. Clean up. Remove "old repo" origin and its dependencies, and rename new origin

Write-Verbose 'Cleaning up...'

git remote -v

git remote rm origin

git remote rename GHorigin origin

Write-Verbose 'MIGRATION COMPLETED'
### Done! Now your local git repo is connected to "new repo" remote
### which has all the branches, tags and commits history.