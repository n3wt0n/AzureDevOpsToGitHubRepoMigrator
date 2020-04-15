# Azure DevOps To GitHub Repository Migrator

Scripts to migrate a Git Repo from Azure DevOps to GitHub

[![License](https://img.shields.io/github/license/n3wt0n/AzureDevOpsToGitHubRepoMigrator.svg)](https://github.com/n3wt0n/AzureDevOpsToGitHubRepoMigrator/blob/master/LICENSE)

## Migration Steps

The script will perform the migration in 4 steps:

1. Make sure you have a local copy of all "old repo", branches and tags
  - Create a new folder (with name in the format "_AZUREDEVOPSREPONAME_-Migration")
  - Clone the Azure DevOps repo into it
  - Check out all the branches as well
2. Add the GitHub repo as a new remote origin
3. Push all local branches and tags to the new repo
4. Clean up. Remove the Azure DevOps repo and its dependencies from the origins, set the GitHub one as only _origin_