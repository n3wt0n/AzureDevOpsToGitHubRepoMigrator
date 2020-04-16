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

Write-Verbose "STARTING MIGRATION FROM $AzDOOrg/$AzDOPrj/$AzDORepo to $GHUser/$GHRepo"

# STEP 1: Make sure you have a local copy of all "old repo", branches and tags
Write-Verbose 'Cloning Source Repo...'

$migrationFolder = "$AzDORepo-Migration"

mkdir $migrationFolder

cd $migrationFolder

$cloneUrl = "https://$AzDOPAT@dev.azure.com/$AzDOOrg/$AzDOPrj/_git/$AzDORepo"

git clone $cloneUrl .

Write-Verbose 'Cloning Source Repo Branches...'

$branches = git branch -r

$branches -split "`n" | ForEach-Object {
    if( -not ($_ -clike '*HEAD*') -and ($_.Trim() -ne 'origin/master') )
    {
        $branchName = $_.Trim() -replace 'origin/'
        
        git checkout -b $branchName $_.Trim()
    }
}

git checkout master

# STEP 2: Add a "new repo" as a new remote origin:

Write-Verbose 'Adding Target Repo as Origin'

$GHoriginUrl = "https://github.com/$GHUser/$GHRepo.git"
git remote add GHorigin $GHoriginUrl

# STEP 3: Push all local branches and tags to the new repo.

Write-Verbose 'Pushing all code, branches, and history to Target Repo...'

$GHpushUrl = "https://$GHPAT@github.com/$GHUser/$GHRepo.git"

git push --all $GHpushUrl

Write-Verbose 'Pushing all tags to Target Repo...'

git push --tags $GHpushUrl

# STEP 4. Clean up. Remove "old repo" origin and its dependencies, and rename new origin

Write-Verbose 'Cleaning up...'

git remote -v

git remote rm origin

git remote rename GHorigin origin

Write-Verbose 'MIGRATION COMPLETED'
### Done! Now your local git repo is connected to "new repo" remote
### which has all the branches, tags and commits history.