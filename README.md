# Azure DevOps and Azure Red Hat OpenShift 
What are the effective patterns for integrating Azure DevOps and an application platform like Azure Red Hat OpenShift? This repository combines Red Hat’s continuous integration and continuous delivery best practices for application delivery on the Azure Red Hat OpenShift application platform. 

There are several key components that form the building blocks of this demonstration:
1. [Azure Pipeline CI example](https://github.com/lijcam/tailspin-azurepipeline-ci)
2. [OpenShift Tekton CI example](https://github.com/lijcam/tailspin-tekton-ci)
3. [OpenShift Argo CD example](https://github.com/lijcam/tailspin-argocd-cd)
# Getting Started

To run the demo setup, several command line tools need to be installed, `argocd`, `az`, `jq`, and `oc`.
And the setup has been broken into two steps:

1. Firstly [Set up Azure DevOps](setup/AzureDevOps/README.md) and import the demo repositories, then
2. Provision the [Azure Red Hat OpenShift cluster](setup/AzureRedHatOpenShift/README.md):

# Default configuration
Modifying the names and locations of resources is described in `defaults.env` file. Options that can change include, names of git repositories and source locations, component names such as the cluster, and resource groups.


