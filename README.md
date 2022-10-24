# Light touch, Azure OpenShift configuration system.

Build a demo on top of Azure DevOps and Azure Red Hat OpenShift. Can't remember all those `az` commands? Me neither, so we scripted those steps up.

The following example demo components that currently support the light-touch workflow:
1. [Azure Pipeline CI example](https://github.com/lijcam/tailspin-azurepipeline-ci)
2. [OpenShift Tekton CI example](https://github.com/lijcam/tailspin-tekton-ci)
3. [OpenShift Argo CD example](https://github.com/lijcam/tailspin-argocd-cd)
# Getting Started

To run the demo setup, several command line tools need to be installed, `argocd`, `az`, `jq`, and `oc`.
And the setup has been broken into two steps:

1. firstly [Set up Azure DevOps](setup/AzureDevOps/README.md) and import the demo repositories, then
2. provision the [Azure Red Hat OpenShift cluster](setup/AzureRedHatOpenShift/README.md):

# Default configuration
Modifying the names and locations of resources is described in `defaults.env` file. Options that can change include, names of git repositories and source locations, component names such as the cluster, and resource groups.
