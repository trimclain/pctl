SHELL := /bin/bash

all:
	@echo 'Type `make help` to see the help menu.'

help: ## Prints this help menu
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

container: ## Build a docker container for testing
	@if ! command -v docker > /dev/null; then echo "Docker not found, install it first"; \
		elif [[ $$(docker images | grep pctltest) ]]; then \
		echo 'Container "pctltest" already exists'; else echo 'Building the "pctltest" container' \
		&& docker build -t pctltest . && echo "Built successfully"; fi

delcontainer: ## Delete the docker container for testing
	@if [[ $$(docker images | grep pctltest) ]]; then echo 'Deleting "pctltest" container' && \
		docker image rm pctltest:latest -f; \
		else echo 'Container "pctltest" not found. Build it with `make container`.'; fi

rebuild: delcontainer container ## Rebuild existing docker container

test: ## Run the pctltest container interactively
	@if [[ $$(docker images | grep pctltest) ]]; then docker run -it pctltest; \
		else echo 'Container "pctltest" not found. Build it with `make container`.'; fi


.PHONY: all help container delcontainer rebuild test
