# Azure Red Hat OpenShift cluster

A pull secret is needed to provision an Azure Red Hat OpenShift cluster. Download it from the [Red Hat cloud console](https://console.redhat.com/openshift/install/pull-secret) and make a copy  at `setup/AzureRedHatOpenShift/put-pull-secrect-in-here/pull-secret.txt`

Run `aro-create.sh` to provision the cluster. The script will prompt you to log in to Azure and accept a self-signed certificate. 

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

Depending what you're trying to show case, there is post cluster install configuration to apply. Provided are two manifests to install and perform light integration of Tekton and Argo CD.

```
cd ./manifests
oc apply -f openshift-gitops.yaml
oc apply -f openshift-pipelines.yaml
```
