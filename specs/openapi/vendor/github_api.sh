#!/usr/bin/env bash

source bin/config.sh

specs_file="${SPECS_OPENAPI_VENDOR}/github_api.json"

if [[ -f "${specs_file}" ]]; then
    exit 0
fi

curl -s "https://raw.githubusercontent.com/github/rest-api-description/main/descriptions/api.github.com/api.github.com.json" --output "${specs_file}"

echo "${specs_file}"