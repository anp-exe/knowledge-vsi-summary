SLUG := knowledge-vsi-summary
PORT ?= 3030

.DEFAULT_GOAL := help

node_modules: package.json package-lock.json
	npm install

install: ## Install dependencies (npm install)
	npm install

live: node_modules ## Run the dev server (alias: preview)
	npx slidev --open --port $(PORT)

preview: live ## Alias for live

pdf: node_modules ## Export the deck to $(SLUG).pdf
	npx slidev export --format pdf --with-toc --output $(SLUG).pdf

build: node_modules ## Build a static SPA into dist/
	npx slidev build --base ./ --out dist

stop: ## Free the dev-server port
	-fuser -k $(PORT)/tcp

clean: ## Remove dist/ and the exported PDF
	rm -rf dist $(SLUG).pdf

distclean: clean ## clean + remove node_modules
	rm -rf node_modules

help: ## Show this help
	@awk 'BEGIN {FS = ":.*## "} /^[a-zA-Z0-9_-]+:.*## / {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: install live preview pdf build stop clean distclean help
