# Azure tools and DevOps subscription

The scripts here seed Azure DevOps projects from a source Git Repository. 

Populating the Azure DevOps subscription is a straightforward operation, by running from the `AzureDevOps` directory:
```
./ado-create.sh [name of the project] [Path to DevOps organisation]
```
The default configuration is stored in `defaults.env` which also provides the shared functions for the create and delete scripts. 
Cleaning up the projects is as simple as:
```
./ado-delete.sh [name of the project] [Path to DevOps organisation]
```

## The details 

There are a few dependencies that need to be satisfied before the automation scripts can function, as well as a few manual steps—sorry! The simple ones being installing the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli), [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH), and [jq](https://stedolan.github.io/jq/download/).

The Azure DevOps extension is already required, this can be installed by running:

```
az devops --help
The command requires the extension azure-devops. Do you want to install it now? The command will continue to run after the extension is installed. (Y/n): y
```

You will also need to create an [Azure DevOps organisation](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/create-organization?view=azure-devops). Take a copy of the organisation url, ie — `https://dev.azure.com/{yourorganization}`. Either pass it through as a positional argument when creating the project. 

For example:
```
./ado-create.sh "Demo Time" "https://dev.azure.com/DEMO-TIME"
```
Or update the default varibles in `defaults.env`:
```
DEFAULT_AZURE_DEVOPS_PROJECT="Demo Time"
DEFAULT_AZURE_DEVOPS_ORGANIZATION="https://dev.azure.com/DEMO-TIME"
```

### Including additional Git Repos

An `zsh` associative array holds the repository locations in `defaults.env`.
Additional repositories can be added by appending:

```
SOURCE_GIT_REPOS[name-of-repository]="http://mygit.com/repo.git"
```
