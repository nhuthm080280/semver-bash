
### Recommended VSCode plugins
- Bats (Bash Automated Testing System)
- BASH Extension Pack which includes:
  + shell-format
  + Bash Debug
  + Bash IDE

### Getting started
#### To run command ./cli download testing-file in dev environment, simply run

```
make run-dev args="download testing-file"
```

#### To run tests
```
make tests
```

### How to use Github OpenApi generated bash files
Go to [vendor/github.com/api/README.md](./vendor/github.com/api/README.md) after running `make unpack` to generate the OpenApi code.