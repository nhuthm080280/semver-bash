echo "# this file is located in 'pkg/stop_echo_server_command.sh'"
echo "# code for 'cli stop-echo-server' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

pid_file=/tmp/project-echo-server.pid

if [[ ! -f "${pid_file}" ]]; then
    exit 0
fi

PID=$(cat "${pid_file}")

if ps -p $PID > /dev/null
then
   echo "$PID is running"
   kill "$(< "${pid_file}")"
fi

rm -f "${pid_file}"