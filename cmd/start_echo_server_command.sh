echo "# this file is located in 'pkg/start_echo_server_command.sh'"
echo "# code for 'cli start-echo-server' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args


echo "Starting echo server"
PORT=2000
# don't keep open this script's stderr
ncat -l $PORT -k -c 'xargs -n1 echo' 2>/dev/null & 
echo $! > /tmp/project-echo-server.pid
echo "$PORT" >&2
