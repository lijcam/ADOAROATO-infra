#!/bin/zsh
#
# Login to the demo Argo CD instance.

set -ex
source ./../defaults.env

#######################################
# Get the host address to the argocd instance.
# Globals:
#   none
# Outputs:
#   Writes ID to stdout
#######################################
get_argocd_route() {

  local ROUTE=$(oc get route openshift-gitops-server \
    --namespace openshift-gitops \
    --output jsonpath='{.spec.host}')

  echo $ROUTE

}

#######################################
# The main routine.
# Globals:
#   none
# Arguments:
#   None
#######################################
main() {

  check_dependencies

  argocd login --insecure --sso $(get_argocd_route)

}

main