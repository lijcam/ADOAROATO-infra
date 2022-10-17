#!/bin/zsh
#
# Log the oc client into Azure Red Hat OpenShift.
set -ex
source ./../defaults.env

#######################################
# The main routine.
# Globals:
#   none
# Arguments:
#   None
#######################################
main() {

  check_dependencies

  echo "Here are your kubeadmin details"
  az aro list-credentials --name $AZURE_CLUSTER --resource-group $AZURE_RESOURCE_GROUP

  echo "Here is your OpenShift console link"
  az aro show --name $AZURE_CLUSTER --resource-group $AZURE_RESOURCE_GROUP -o tsv --query "consoleProfile.url"

  USERN=$(az aro list-credentials --name $AZURE_CLUSTER --resource-group $AZURE_RESOURCE_GROUP -o tsv --query 'kubeadminUsername')
  PSSWD=$(az aro list-credentials --name $AZURE_CLUSTER --resource-group $AZURE_RESOURCE_GROUP -o tsv --query 'kubeadminPassword')
  API=$(az aro show --name $AZURE_CLUSTER --resource-group $AZURE_RESOURCE_GROUP -o tsv --query 'apiserverProfile.url')

  oc login -u ${USERN} -p ${PSSWD} ${API}

}

main "$@"