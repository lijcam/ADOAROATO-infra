# Azure Red Hat OpenShift cluster

A pull secret is needed to provision an Azure Red Hat OpenShift cluster. Download it from the [Red Hat cloud console](https://console.redhat.com/openshift/install/pull-secret) and make a copy  at `setup/AzureRedHatOpenShift/put-pull-secrect-in-here/pull-secret.txt`

Run ‘aro-create.sh’ to provision the cluster. The script will prompt you to log in to Azure and accept a self-signed certificate. 

```
cd setup/AzureRedHatOpenShift
./aro-create.sh
```

Cleaning up cluster is as simple as:

```
./aro-delete.sh
```

Logging into the cluster with the `oc` command as the kubeadmin has been automated, you can refresh your credentials by running:

```
./aro-login.sh
```

# Deploy the OpenShift configuration.

Once created, deploy the operators and web-app by running the ‘argo-create.sh’ script. The script will ask you to accept some certificates and authenticate to ArgoCD by logging into the OpenShift console. For this, the script will output the kubeadmin username and password which can be used to log in. 

## Script Summary

1. `argo-create.sh` — Sets up the argocd operator in the argocd namespace, then registers the web-app in argo, and syncs the application into the web-app namespace. 
2. `argo-delete.sh` — Deletes argocd and the web-app from your cluster. Useful for resetting the demo.
3. `aro-create.sh` — Creates an Azure Red Hat OpenShift cluster.
4. `aro-delete.sh` — Deletes the Azure Red Hat OpenShift cluster, and resource group. This is a nuclear option, a hard reset.
5. `aro-login.sh` — Logs into the cluster using the `kubeadmin` credentials.



