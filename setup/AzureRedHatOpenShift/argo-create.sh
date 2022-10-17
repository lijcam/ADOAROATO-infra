#!/bin/bash
set -ex


#Create Namespaces and install operator 
#oc create -f manifests/namespace-subscription.yaml 
#sleep 120
#Need to allow time for resource to be created, IS THERE A SMARTER WAY?
#Setup auth, rbac etc
#oc create -f manifests/sso-authentication.yaml
#sleep 120
#Wait for Resource creation
#oc project argocd

#Get the argocd server
ARGOCD_ROUTE=$(oc -n argocd get route argocd-server -o jsonpath='{.spec.host}')

#login
argocd login --insecure --sso $ARGOCD_ROUTE

#Add the cluster
export ARGOCLUSTER=$(oc whoami --show-server)
#argocd --insecure cluster add $(echo "argocd/api-${ARGOCLUSTER}/kube:admin" | tr . -)

#Apply the demo application  
cat manifests/web-app.yaml \
  | envsubst \
  | oc apply -f -

argocd app sync web-app

