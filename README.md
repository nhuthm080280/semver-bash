
### Prerequisites
- Docker
- Java 11+
- jq
- curl

### Recommended VSCode plugins
- Bats (Bash Automated Testing System)
- BASH Extension Pack which includes:
  + shell-format
  + Bash Debug
  + Bash IDE

### Getting started
- Clone the repo
```
git clone --recurse-submodules git@github.com:BeanContinuous/semver-bash.git
```

- To run `semver get` in dev environment, simply run
```
GIT_PLATFORM=GitHub make run-dev args="get"
```

- Setup GitHub PAT for E2E tests
Create file `test/.secrets` then put the GitHub PAT as below:
```
export GITHUB_PAT_OWNER=
export GITHUB_PAT_CONTRIBUTOR=
```
Then run these 2 commands to clone GitHub Sandbox Repositories
```
git clone https://oauth2:${GITHUB_PAT_OWNER}@github.com/BeanGithubSandboxUpstream/semver-bash.git test/sandbox/github/upstream

git clone https://oauth2:${GITHUB_PAT_CONTRIBUTOR}@github.com/PeterBeanBotContributor/semver-bash.git test/sandbox/github/contributor
```

- To run all tests
```
make tests
```
- To run only unit tests
```
make unit-tests
```
- To run only E2E tests
```
make e2e-tests
```



### Where to find documentation for the Github OpenApi generated bash files
Go to [vendor/github.com/api/README.md](./vendor/github.com/api/README.md) after running `make unpack` to generate the OpenApi code.