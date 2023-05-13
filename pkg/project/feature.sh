#!/usr/bin/env bash

function feature {
    case $1 in
        start-echo-server)
            echo "Starting echo server"
            PORT=2000
            # don't keep open this script's stderr
            ncat -l $PORT -k -c 'xargs -n1 echo' 2>/dev/null & 
            echo $! > /tmp/project-echo-server.pid
            echo "$PORT" >&2
        ;;
        
        stop-echo-server)
            kill "$(< "/tmp/project-echo-server.pid")"
            rm /tmp/project-echo-server.pid
        ;;

        *)
            FIRST_RUN_FILE="/tmp/bats-tutorial-project-ran"
            SECOND_RUN_FILE="/tmp/bats-tutorial-project-ran-twice-or-more"

            if [[ ! -e "$FIRST_RUN_FILE" ]]; then
                echo "Welcome to our project!"
                touch "$FIRST_RUN_FILE"
            else
                echo "touching the second file"
                touch "$SECOND_RUN_FILE"
            fi

            if [[ $(type -t execute_github_api_client) == function ]]; then
                echo "execute_github_api_client exists"
            else
                echo "execute_github_api_client does NOT exist"
            fi


            echo "NOT IMPLEMENTED!" >&2
            exit 1
        ;;
    esac
}