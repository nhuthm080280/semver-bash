echo "# this file is located in 'cmd/get_command.sh'"
echo "# code for 'semver get' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

get_pr_git_port "${args[source_value]}" | jq