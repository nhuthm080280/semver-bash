#!/usr/bin/env bash

#######################################
# Get GitHub PR details
# Globals:
#   GITHUB_REPOSITORY_NAME
#   GITHUB_REPOSITORY_OWNER
#   pr_details
#   pull_number
# Arguments:
#   pr_number
# Return:
#   pr_details json
#######################################
function get_pr_github_adaptor() {
  pull_number=$1
  pr_details=$(execute_github_api pullsGet owner="${GITHUB_REPOSITORY_OWNER}" repo="${GITHUB_REPOSITORY_NAME}" pull_number="${pull_number}")
  echo "${pr_details}"
}