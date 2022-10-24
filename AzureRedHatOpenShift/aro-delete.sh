#!/bin/zsh
#
# Remove Azure Red Hat OpenShift cluster.
set -ex
source ./../../defaults.env

#######################################
# The main routine.
# Globals:
#   none
# Arguments:
#   None
#######################################
main() {

  check_dependencies

  # Remove the client token. But if we don't have one, we still want to continue.
  oc logout || true

  az aro delete --yes --resource-group $AZURE_RESOURCE_GROUP --name $AZURE_CLUSTER

  az group delete --yes --name $AZURE_RESOURCE_GROUP

}

main "$@"