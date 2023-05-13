#!/usr/bin/env bash

function execute_github_api {
    if [[ -z ${GITHUB_TOKEN} ]]; then
    # echo "no auth"
        execute_github_api_client orgsGet org=BeanCloudServices --host https://api.github.com
    else
    # echo "with token ${GITHUB_TOKEN}"
        execute_github_api_client orgsGet org=BeanCloudServices --host https://api.github.com Authorization:"Bearer ${GITHUB_TOKEN}"
    fi
}