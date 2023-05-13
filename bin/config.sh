#!/usr/bin/env bash

# Specs
SPECS_OPENAPI=./specs/openapi
SPECS_OPENAPI_VENDOR=${SPECS_OPENAPI}/vendor

# Vendor
export VENDOR_OPENAPI_TOOL_GEN=./vendor/openapitools.org/generator
export VENDOR_GITHUB_API=./vendor/github.com/api

# OpenApi
export OPENAPI_GEN_VERSION=6.6.0
export OPENAPI_GEN_CLI=${VENDOR_OPENAPI_TOOL_GEN}/openapi-generator-${OPENAPI_GEN_VERSION}/bin/utils/openapi-generator-cli.sh

# Github API
export EXEC_GITHUB_API=${VENDOR_GITHUB_API}/exec.sh
export EXEC_GITHUB_GET=${VENDOR_GITHUB_API}/exec-get.sh

# Bashly
function bashly-docker {    
    docker run --rm --user $(id -u):$(id -g) --volume "$PWD:/app" -e BASHLY_ENV="${ENV-development}" dannyben/bashly "$@"
}
