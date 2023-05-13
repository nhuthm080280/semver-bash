
.PHONY: all
all: tests

.PHONY: dependencies
dependencies:
	./bin/beandev.sh download-dependencies

.PHONY: unpack
unpack: dependencies
	./bin/beandev.sh generate-openapi-client github_api

.PHONY: dev
dev: unpack
	./bin/beandev.sh dev

.PHONY: build
build: unpack
	./bin/beandev.sh build

.PHONEY: unit-test
unit-test:
	./bin/beandev.sh unit-test $(TEST_PATH)

.PHONY: unit-tests
unit-tests:
	./bin/beandev.sh unit-tests

.PHONY: feature-tests
feature-tests:
	./test/bats/bin/bats test/

.PHONY: tests
tests: build feature-tests unit-tests

.PHONY: run-dev
run-dev: dev
	./build/cli $(args)