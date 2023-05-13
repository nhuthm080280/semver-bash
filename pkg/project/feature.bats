# https://bats-core.readthedocs.io/en/stable/tutorial.html#quick-installation

setup() {
    load "$PROJECT_ROOT/test/test_helper/bats-support/load"
    load "$PROJECT_ROOT/test/test_helper/bats-assert/load"

    file_name="feature.sh"

    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    file_path="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    source ${file_path}/${file_name}
}

teardown() {
    rm -f /tmp/bats-tutorial-project-ran
}

@test "can run our script" {
    # if [[ -e /tmp/bats-tutorial-project-ran-twice-or-more ]]; then
    #     skip 'The SECOND_RUN_FILE already exists'
    # fi

    run feature # notice `run`!
    assert_output --partial 'Welcome to our project!'
    assert_output --partial 'execute_github_api_client does NOT exist'
    assert_failure

    run feature
    refute_output --partial 'Welcome to our project'
}
