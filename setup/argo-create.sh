#!/bin/bash

#Create Namespaces and install operator 
oc create -f manifests/namespace-subscription.yaml
sleep 120
#Need to allow time for resource to be created, IS THERE A SMARTER WAY?
#Setup auth, rbac etc
oc create -f manifests/sso-authentication.yaml
sleep 120
#Wait for Resource creation
oc project argocd

#Get the argocd server
ARGOCD_ROUTE=$(oc -n argocd get route argocd-server -o jsonpath='{.spec.host}')

#login
argocd login --sso $ARGOCD_ROUTE

#Add the cluster
ARGOCLUSTER=$(echo $(oc get cluster -o jsonpath='{.items[].spec.domain}{"\n"}'):6443)
argocd cluster add $(echo "argocd/api-${ARGOCLUSTER}/kube:admin" | tr . -)

#Server line in manifest for argocd application needs to be updated
sed -i '$ d' manifests/web-app.yaml
echo "    server: https://api.${ARGOCLUSTER}" >> manifests/web-app.yaml
#Launch the argocd application  
oc create -f manifests/web-app.yaml
argocd app sync web-app

