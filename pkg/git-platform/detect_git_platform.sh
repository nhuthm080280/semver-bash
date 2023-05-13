#!/usr/bin/env bash

function detect_git_platform {
    if [[ -z "${GIT_PLATFORM}" ]]; then
        GIT_PLATFORM=GitHub
    fi

    case "${GIT_PLATFORM}" in
        "GitHub")
            printf "GitHub is supported\n"

            if [[ -z "${GITHUB_REPOSITORY_OWNER}" ]]; then
                echo "- Please set $(cyan_underlined GITHUB_REPOSITORY_OWNER) environment variable"
                to_exit=true
            fi
            
            if [[ -z "${GITHUB_REPOSITORY_NAME}" ]]; then
                echo "- Please set $(cyan_underlined GITHUB_REPOSITORY_NAME) environment variable"
                to_exit=true
            fi

            if [[ -n "${to_exit}" ]]; then
                echo 
                exit 1
            fi
        ;;
        "GitLab")
            echo "Unsupported Platform"
            exit 1
        ;;
        *)
            echo "Unknown Platform"
            exit 1
        ;;
    esac
}