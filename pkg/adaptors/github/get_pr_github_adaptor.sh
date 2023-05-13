#!/usr/bin/env bash

function get_pr_github_adaptor {
    pull_number=$1
    execute_github_api pullsGet owner="${GITHUB_REPOSITORY_OWNER}" repo="${GITHUB_REPOSITORY_NAME}" pull_number="${pull_number}"
}