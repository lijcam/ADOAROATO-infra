#!/bin/bash
#
# Remove Argo CD resources.
set -ex 
source ./../../defaults.env

main() {

  check_dependencies

  oc delete -f manifests/web-app.yaml
  oc delete -f manifests/sso-authentication.yaml
  oc delete -f manifests/namespace-subscription.yaml

}

main "$@"