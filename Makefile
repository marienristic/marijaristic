SHELL := /bin/bash
.POSIX:

DATEOF:=$(shell date +%FT%T)
HUGO_VERSION:=$(shell curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep 'tag_name' | cut -d '"' -f 4 | cut -c 2-)

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

publish: ## One-shot git add all changes, commit and push your updates
	git add .
	git commit -m "📤 Update files"
	git push

run: ## Run the local development server
	hugo server
