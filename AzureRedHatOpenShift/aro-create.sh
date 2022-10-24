#!/bin/zsh
#
# Setup Azure Red Hat OpenShift cluster.
set -ex
source ./../defaults.env

# Look for the pull secret file

#######################################
# Check to see if the pull-secret exists.
# Globals:
#   none
# Arguments:
#   None
#######################################
stop_if_pull_secret_not_found() {

  if [[ ! -f put-pull-secret-in-here/pull-secret.txt ]]; then
     >&2 echo "Script can't find the pull secret. Download one here https://console.redhat.com/openshift/install/pull-secret"
     return -1
  fi
}

#######################################
# The main routine.
# Globals:
#   none
# Arguments:
#   None
#######################################
main() {

  check_dependencies && stop_if_pull_secret_not_found

  #Register our resource providers 
  az provider register -n Microsoft.RedHatOpenShift --wait
  az provider register -n Microsoft.compute --wait
  az provider register -n Microsoft.Storage --wait
  az provider register -n Microsoft.Authorization --wait

  #Create the resource group for the cluster
  az group create --name $AZURE_RESOURCE_GROUP --location $AZURE_LOCATION

  #Create a cluster vnet
  az network vnet create --resource-group $AZURE_RESOURCE_GROUP --name aro-vnet --address-prefixes 10.0.0.0/22

  #Create master subnet
  az network vnet subnet create --resource-group $AZURE_RESOURCE_GROUP --vnet-name aro-vnet --name master-subnet --address-prefixes 10.0.0.0/23 --service-endpoints Microsoft.ContainerRegistry

  #Create worker subnet 
  az network vnet subnet create --resource-group $AZURE_RESOURCE_GROUP --vnet-name aro-vnet --name worker-subnet --address-prefixes 10.0.2.0/23 --service-endpoints Microsoft.ContainerRegistry 

  #Do network policy stuff 
  az network vnet subnet update --name master-subnet --resource-group $AZURE_RESOURCE_GROUP  --vnet-name aro-vnet --disable-private-link-service-network-policies true

  #Create the cluster; Requires pull secret in active directory
  az aro create  --resource-group  $AZURE_RESOURCE_GROUP --name $AZURE_CLUSTER --vnet aro-vnet --master-subnet master-subnet --worker-subnet worker-subnet --pull-secret @put-pull-secret-in-here/pull-secret.txt 

  source ./aro-login.sh

}

main "$@"
