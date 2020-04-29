# SCRIPTS - Azure DevOps To GitHub Repository Migrator

The scripts to perform the migration.

## Usage

There are 3 migration scripts:

- migrateVerbose.ps1 - _Interactive and Verbose_
- migrate.ps1 - _Non Interactive_
- migrate-mirror.ps1 - _Non Interactive_, ___Mirror___

### Interactive & Verbose

The interactive verbose version of the migration, _migrateVerbose.ps1_, is ideal for __manual migrations__.

It is interactive, it asks for the input in a nicer way, and it prints out the status of the migration.

> NOTE: you need __both__ scripts, because _migrateVerbose.ps1_ uses _migrate.ps1_ to perform the actual migrations  

### Non-interactive

The non-interactive migration script, _migrate.ps1_, is instead ideal for __automated scripted migrations__

To invoke it, use the following syntax:

```PowerShell
./migrate.ps1 -AzDOPAT <AZURE_DEVOPS_PAT> -AzDOOrg <AZURE_DEVOPS_ORGANIZATION> -AzDOPrj <AZURE_DEVOPS_PROJECT_NAME> -AzDORepo <AZURE_DEVOPS_REPOSITORY_NAME> -GHPAT <GITHUB_PAT> -GHUser <GITHUB_USERNAME> -GHRepo <GITHUB_REPOSITORY_NAME>
```

> NOTE: you need only the _migrate.ps1_ script

### Mirror

This script uses the _--mirror_ flag for both the CLONE and the PULL operations.

To invoke it, use the following syntax:

```PowerShell
./migrate-mirror.ps1 -AzDOPAT <AZURE_DEVOPS_PAT> -AzDOOrg <AZURE_DEVOPS_ORGANIZATION> -AzDOPrj <AZURE_DEVOPS_PROJECT_NAME> -AzDORepo <AZURE_DEVOPS_REPOSITORY_NAME> -GHPAT <GITHUB_PAT> -GHUser <GITHUB_USERNAME> -GHRepo <GITHUB_REPOSITORY_NAME>
```

> __WARNING: This script leaves the repository on the local folder in a non usable state__, meaning that it won't be possible to use it as a normal repository aka wokring copy

## Prerequisites

Both the scripts and the containerized version require a series of prerequisites to work.

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

- The GitHub __Username__ or (__Organization__) with which you have created the destination repository
- The name of the GitHub __Destination Repository__

> Please note that the Destination Repo ___must be empty and not be initialized___.

You also need to generate a __PAT__ (Personal Access Token) in GitHub with the following permissions:

- repo (Full control)

For instruction on how to generate a PAT in GitHub, take a look at the [official documentation here](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token)