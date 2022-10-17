#!/bin/bash
#
# Remove Azure Red Hat OpenShift cluster.
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

  az aro delete --resource-group $AZURE_RESOURCE_GROUP --name $AZURE_CLUSTER

}

main "$@"