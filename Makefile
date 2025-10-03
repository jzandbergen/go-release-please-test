.PHONY: local-build help

# Detect container runtime
CONTAINER_RUNTIME := $(shell command -v docker 2> /dev/null)
ifndef CONTAINER_RUNTIME
	CONTAINER_RUNTIME := $(shell command -v podman 2> /dev/null)
endif
ifndef CONTAINER_RUNTIME
	$(error Neither docker nor podman found. Please install one of them.)
endif

# Default image name
IMAGE_NAME ?= go-release-please-test
IMAGE_TAG ?= local

help: ## Show this help message
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

local-build: ## Build Docker image locally
	@echo "Building with $(CONTAINER_RUNTIME)..."
	$(CONTAINER_RUNTIME) build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	@echo "Image built: $(IMAGE_NAME):$(IMAGE_TAG)"