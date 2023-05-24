#!/usr/bin/env bash

#######################################
# Wrapper to execute GitHub OpenApi remote procedures.
# Globals:
#   GITHUB_TOKEN
# Arguments:
#  operationId
#  queryParam1=value1
#  header_key1:header_value1
#  json_post_content_key_1:='"json_post_content_value1"'
# Example:
#   pullsGet owner="${GITHUB_REPOSITORY_OWNER}" repo="${GITHUB_REPOSITORY_NAME}" pull_number="${pull_number}"
#######################################
function execute_github_api() {
  if [[ -z ${GITHUB_TOKEN} ]]; then
    # echo "no auth"
    execute_github_api_client "$@" --host https://api.github.com
  else
    # echo "with token ${GITHUB_TOKEN}"
    execute_github_api_client "$@" --host https://api.github.com Authorization:"Bearer ${GITHUB_TOKEN}"
  fi
}
