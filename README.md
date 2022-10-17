# Azure DevOps and Azure Red Hat OpenShift 
What are the effective patterns for integrating Azure DevOps and an application platform like Azure Red Hat OpenShift? This repository combines Red Hat’s continuous integration and continuous delivery best practices for application delivery on the Azure Red Hat OpenShift application platform. 

There are several key components that form the building blocks of this demonstration:
1. [Azure Pipeline CI example](https://github.com/lijcam/tailspin-azurepipeline-ci)
2. [OpenShift Tekton CI example](https://github.com/lijcam/tailspin-tekton-ci)

# Getting Started

Prerequisites: OpenShift (oc), ArgoCD (argocd), and Azure (az) CLI tools. 

A lot of the setup is automated, it's not perfect, and there are still a few manual set steps:

1. Firstly [Set up Azure DevOps](setup/AzureDevOps/README.md) and import the demo repositories. 
2. Provision the Azure Red Hat OpenShift instance as follows:

Clone this repository into a local directory. 

A pull secret is needed to provision an Azure Red Hat OpenShift cluster. Download it from the [Red Hat cloud console](https://console.redhat.com/openshift/install/pull-secret) and make a copy  at `setup/put-pull-secrect-in-here/pull-secret.txt`

Run the ‘setup/cluster-create.sh’ script to provision a cluster and install the OpenShift instance. The script will prompt you to log in to Azure and accept a self-signed certificate. 

```
./cluster-create.sh
```

Once created, deploy the operators and web-app by running the ‘argo-create.sh’ script. The script will ask you to accept some certificates and authenticate to ArgoCD by logging into the OpenShift console. For this, the script will output the kubeadmin username and password which can be used to log in. 

```
./argo-create.sh
```

## Script Summary

1. `setup/cluster-create.sh` — Creates an Azure Red Hat OpenShift cluster.
2. `setup/argo-create.sh` — Sets up the argocd operator in the argocd namespace, then registers the web-app in argo, and syncs the application into the web-app namespace. 

3. `setup/utilities/ocp-login.sh` — Prints the `kubeadmin` username, password, and webconsole url. Finally authenticates as the `kubeadmin`.

4. `setup/utilities/delete-cluster.sh` — Deletes the Azure Red Hat OpenShift cluster, this is the nuclear option, a hard reset.

5. `setup/utilites/delete-argo.sh` — Deletes argocd and the web-app from your cluster. Useful for resetting the demo.


