# DOCKER - Azure DevOps To GitHub Repository Migrator

This is the containerized version of the migrator. It uses the [migrate-mirror.ps1](../Scripts/migrate-mirror.ps1) script.

## Usage

### Use the public image

The easiest way to use this migration utility is to consume the public image on Docker Hub: [n3wt0n/azdo2ghrepomigrator](https://hub.docker.com/r/n3wt0n/azdo2ghrepomigrator)

```bash
docker pull n3wt0n/azdo2ghrepomigrator
```

To launch the container, you can use the following command:

```bash
docker run -it -e "AZDOPAT=xxx" -e "AZDOORG=xxx" -e "AZDOPRJ=xxx" -e "AZDOREPO=xxx" -e "GHPAT=xxx" -e "GHUSER=xxx" -e "GHREPO=xxx" n3wt0n/azdo2ghrepomigrator
```

> See the '_Required Environment Variables_'section below to know more about the Environment Variables you need to use.

### Create your own container image

If you instead prefer creating your own container image, follow these steps:

1. Download or clone the whole repo
2. Go to the "Docker" folder
3. Launch the "_buildImage.bat_" or the "_buildImage.sh_" script to invoke the _docker build_ command

> If you prefer using the command manually against the _Dockerfile_ make sure you are executing it on the root of the repo

## Required Environment Variables

The container needs the following environment variables (and values) to run.

- __AZDOPAT__: __PAT__ (Personal Access Token) in Azure DevOps with the _Code > Read_ permissions granted
- __AZDOORG__: name of the Azure DevOps __Organization__ where your source repository resides (_the XXX in dev.azure.com/XXX or XXX.visualstudio.com_)
- __AZDOPRJ__: name of the Azure DevOps __Team Project__ where the source repository resides
- __AZDOREPO__: name of the Azure DevOps __Source Repository__ to migrate
- __GHPAT__: __PAT__ (Personal Access Token) in GitHub with the _repo (Full control)_ permmissions granted
- __GHUSER__: GitHub __Username__ with which you have created the destination repository
- __GHREPO__: name of the GitHub __Destination Repository__

> For instruction on how to generate a PAT in Azure DevOps, take a look at the [official documentation here](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page#create-personal-access-tokens-to-authenticate-access)

> For instruction on how to generate a PAT in GitHub, take a look at the [official documentation here](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token)

> Please note that the Destination Repo ___must be empty and not be initialized___.