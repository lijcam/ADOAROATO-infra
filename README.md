# Azure DevOps and Azure Red Hat OpenShift 
What are the effective patterns for integrating Azure DevOps and an application platform like Azure Red Hat OpenShift? This repository combines Red Hat’s continuous integration, continuous delivery best practices for application delivery on the Azure Red Hat OpenShift application platform. 

There are several key components that form the building blocks of this demonstration:
1. [Azure Pipeline CI example](https://github.com/lijcam/tailspin-azurepipeline-ci)
2. [OpenShift Tekton CI example](https://github.com/lijcam/tailspin-tekton-ci)

# Getting Started

A lot of the set up is automated, it's not perfect, there are still a few manual set steps:

1. Firstly [Set up Azure DevOps](setup/AzureDevOps/README.md) and import the demo repositories. 
2. Provision the Azure Red Hat OpenShift instance as follows:

A pull secrect is needed to provision a Azure Red Hat OpenShift cluster. Download it from the [Red Hat cloud console](https://console.redhat.com/openshift/install/pull-secret) and make a copy  at `setup/pull-secret.txt`

You'll need to have authenticated with the `az` command before running:

```
./cluster-create.sh
```

Once created, deploy the operators and web-app:

```
/argo-create.sh
```

## Script Summary

1. `setup/cluster-create.sh` — Creates an Azure Red Hat OpenShift cluster.
2. `setup/argo-create.sh` — Sets up the argocd operator in the argocd namespace, then registers the web-app in argo, and syncs the application into the web-app namespace. 

3. `setup/utilities/ocp-login.sh` — Prints the `kubeadmin` username, password, and webconsole url. Finally authenticates as the `kubeadmin`.

4. `setup/utilities/delete-cluster.sh` — Deletes the Azure Red Hat OpenShift cluster, this is the nuclear option, a hard reset.

5. `setup/utiliites/delete-argo.sh` — Deletes argocd and the web-app from your cluster. Useful for resetting the demo.
