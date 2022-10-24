#!/bin/zsh
#
# Remove Azure DevOps projects.

set -ex
source ./../../defaults.env

main() {

    delete_devops_project

}

main "$@"
