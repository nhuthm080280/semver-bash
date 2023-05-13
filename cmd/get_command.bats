# https://bats-core.readthedocs.io/en/stable/tutorial.html#quick-installation

setup() {
    load "$PROJECT_ROOT/test/test_helper/bats-support/load"
    load "$PROJECT_ROOT/test/test_helper/bats-assert/load"

    file_name="get_command.sh"

    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    file_path="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH=${file_path}:${PATH}

}

teardown() {
    echo ""
}

@test "can return current semver from PR source" {
    # mocks
    execute_github_api() {
        case "$1" in
            "pullsGet")
cat << EOF
{
    "message": "Example API"
}
EOF
                
            ;;
            *)
                echo "Invalid argument"
                exit 1
            ;;
        esac
    }
    
    run ${file_name} # notice `run`!
    # # assert_output --partial 'Welcome to our project!'
    # # assert_output --partial 'execute_github_api_client does NOT exist'
    # # assert_failure
    assert_success

    # # run feature
    # refute_output --partial 'Welcome to our project'
}
