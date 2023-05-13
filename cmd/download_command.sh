echo "# this file is located in 'pkg/download_command.sh'"
echo "# code for 'cli download' goes here"
echo "# you can edit it freely and regenerate (it will not be overwritten)"
inspect_args

echo "before $(red this is red args "${args[source]}") after"
echo "before $(green_bold this is green_bold) after"

git_branch_must_have_semver "calling git branch validation"