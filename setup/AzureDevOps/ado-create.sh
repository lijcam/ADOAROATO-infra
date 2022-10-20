#!/bin/zsh
#
# Setup Azure DevOps and import git repositories.
set -ex
source ./../../defaults.env

#######################################
# Routines to run on script termination, failures, and errors.
# Globals:
#   none
# Arguments:
#   None
#######################################
stop_and_cleanup_on() {

  delete_devops_project

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

  # Catch script terminations or errors, and clean up Azure DevOps resources. 
  trap stop_and_cleanup_on INT TERM ERR

  create_devops_project

  for name source_url in "${(@kv)SOURCE_GIT_REPOS}"; do
    create_devops_repo $name && import_git_repo $name $source_url
  done

}

main "$@"
