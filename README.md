# Azure DevOps and Azure Red Hat OpenShift 
What are the effective patterns for integrating Azure DevOps and an application platform like Azure Red Hat OpenShift? This repository combines Red Hat’s continuous integration and continuous delivery best practices for application delivery on the Azure Red Hat OpenShift application platform. 

There are several key components that form the building blocks of this demonstration:
1. [Azure Pipeline CI example](https://github.com/lijcam/tailspin-azurepipeline-ci)
2. [OpenShift Tekton CI example](https://github.com/lijcam/tailspin-tekton-ci)
3. [OpenShift Argo CD example](https://github.com/lijcam/tailspin-argocd-cd)
# Getting Started

Prerequisites: OpenShift (oc), Argo CD (argocd), and Azure (az) CLI. 

A lot of the setup is automated, it's not perfect, and there are still a few manual set steps:

1. Firstly [Set up Azure DevOps](setup/AzureDevOps/README.md) and import the demo repositories, then
2. Provision the [Azure Red Hat OpenShift cluster](setup/AzureRedHatOpenShift/README.md):

```
./argo-create.sh
```


