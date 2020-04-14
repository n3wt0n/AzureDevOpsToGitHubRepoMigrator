Write-Host 'AZURE DEVOPS PARAMS'
$AzDOPAT = Read-Host 'Insert Azure DevOps PAT'
$AzDOOrg = Read-Host 'Insert Azure DevOps Organization name'
$AzDOPrj = Read-Host 'Insert Azure DevOps Project name'
$AzDORepo = Read-Host 'Insert Azure DevOps Repo name'
Write-Host ' '
Write-Host 'GITHUB PARAMS'
$GHUser = Read-Host 'Insert GitHub Usernname'
$GHRepo = Read-Host 'Insert GitHub Repo name'

# STEP 1: Make sure you have a local copy of all "old repo", branches and tags

mkdir OLD_REPO

cd OLD_REPO

$cloneUrl = "https://$AzDOPAT@dev.azure.com/$AzDOOrg/$AzDOPrj/_git/$AzDORepo"

git clone $cloneUrl .

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
$GHoriginUrl = "https://github.com/$GHUser/$GHRepo.git"
git remote add new-origin $GHoriginUrl

# STEP 3: Push all local branches and tags to the new repo.
git push --all new-origin

git push --tags new-origin

# STEP 4. Clean up. Remove "old repo" origin and its dependencies, and rename new origin

git remote -v

git remote rm origin

git remote rename new-origin origin

### Done! Now your local git repo is connected to "new repo" remote
### which has all the branches, tags and commits history.