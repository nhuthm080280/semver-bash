#!/usr/bin/env bash

function project_adaptor_1 {
    if [[ $(type -t execute_github_api_client) == function ]]; then
        # execute_github_api_client --host https://api.github.com orgsGet org=BeanCloudServices
        # execute_github_api_client orgsGet org=BeanCloudServices --host https://api.github.com | jq
        execute_github_api orgsGet org=BeanCloudServices
    fi

    echo "in project adaptor 1"
}