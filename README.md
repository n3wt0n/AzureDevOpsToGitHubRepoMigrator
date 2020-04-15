# Azure DevOps To GitHub Repository Migrator

![ValidatePS](https://github.com/n3wt0n/AzureDevOpsToGitHubRepoMigrator/workflows/ValidatePS/badge.svg)
[![License](https://img.shields.io/github/license/n3wt0n/AzureDevOpsToGitHubRepoMigrator.svg)](https://github.com/n3wt0n/AzureDevOpsToGitHubRepoMigrator/blob/master/LICENSE)

Scripts to migrate a Git Repo from Azure DevOps to GitHub.

It will migrate ALL you have in your repository, including all the __branches__, all the __tags__ and the __complete history__ of commits.

## Migration Steps

The script will perform the migration in 4 steps:

1. Make sure you have a local copy of all "old repo", branches and tags
  - Create a new folder (with name in the format "_AZUREDEVOPSREPONAME_-Migration")
  - Clone the Azure DevOps repo into it
  - Check out all the branches as well
2. Add the GitHub repo as a new remote origin
3. Push all local branches and tags to the new repo
4. Clean up. Remove the Azure DevOps repo and its dependencies from the origins, set the GitHub one as only _origin_

## Prerequisites

The script requires a series of prerequisites to work.

### Azure DevOps

You need to know/have:

- The name of the Azure DevOps __Organization__ where your source repository resides (_the XXX in dev.azure.com/XXX or XXX.visualstudio.com_)
- The name of the Azure DevOps __Team Project___ where the source repository resides
- The name of the Azure DevOps __Source Repository__ to migrate (__because a single Team Project may contain multiple repositories__)

You also need to generate a __PAT__ (Personal Access Token) in Azure DevOps with the following permissions:
- Code
  - Read

For instruction on how to generate a PAT in Azure DevOps, take a look at the [official documentation here](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page#create-personal-access-tokens-to-authenticate-access)

### GitHub

You need to know/have:

- The GitHub __Username__ with which you have created the destinatio repository
- The name of the GitHub __Destionation Repository__

> Please note that the Destination Repo ___must be empty and not be initialized___.

You also need to generate a __PAT__ (Personal Access Token) in GitHub with the following permissions:
- repo (Full control)

For instruction on how to generate a PAT in GitHub, take a look at the [official documentation here](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token)