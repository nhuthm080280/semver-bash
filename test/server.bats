setup_file() {
    load 'test_helper/common-setup'
    _common_setup
    PORT=$(cli start-echo-server 2>&1 >/dev/null)
    export PORT
}

teardown_file() {
    cli stop-echo-server
}

@test "server is reachable" {
    echo "PORT IS $PORT"
    nc -z 127.0.0.1 "$PORT"
}
