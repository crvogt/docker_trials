# Makefile for ROS Docker Development
# Usage: make help

# Image configuration
BASE_IMAGE ?= base
IMAGE_NAME ?= ros-dev
IMAGE_TAG ?= noetic
BASE_IMAGE_FULL = $(BASE_IMAGE):$(IMAGE_TAG)
IMAGE = $(IMAGE_NAME):$(IMAGE_TAG)
CONTAINER = $(IMAGE_NAME)-container

# Host configuration
HOST_IP ?= $(shell hostname -I | awk '{print $$1}')
ROS_MASTER_URI ?= http://$(HOST_IP):11311

# Workspace mounting
WORKSPACE_PATH ?= $(shell pwd)

# Runtime configuration
USE_NVIDIA ?= true
RUNTIME_FLAG = $(if $(filter true,$(USE_NVIDIA)),--runtime=nvidia,)

# Build configuration
NO_CACHE ?= false
CACHE_FLAG = $(if $(filter true,$(NO_CACHE)),--no-cache,)

.PHONY: help build build-base build-extended run run-detached shell stop logs clean clean-all

all: build

help:
	@echo "ROS Docker Development"
	@echo ""
	@echo "=== BUILD ==="
	@echo "  make build        - Build Docker images (base + extended)"
	@echo "  make build-base   - Build base image only"
	@echo ""
	@echo "=== RUN ==="
	@echo "  make run          - Run container interactively"
	@echo "  make run-detached - Run container in background"
	@echo "  make shell        - Open shell in running container"
	@echo "  make stop         - Stop and remove container"
	@echo "  make logs         - View container logs"
	@echo ""
	@echo "=== CLEANUP ==="
	@echo "  make clean        - Remove project containers/images"
	@echo "  make clean-all    - Remove ALL Docker resources"
	@echo ""
	@echo "=== CONFIGURATION ==="
	@echo "  HOST_IP=$(HOST_IP)"
	@echo "  USE_NVIDIA=$(USE_NVIDIA)"
	@echo "  WORKSPACE_PATH=$(WORKSPACE_PATH)"

build: build-extended

build-base:
	@echo "Building base image $(BASE_IMAGE_FULL)..."
	docker build $(CACHE_FLAG) -t $(BASE_IMAGE_FULL) -f Dockerfile.base .
	@echo "Base image built: $(BASE_IMAGE_FULL)"

build-extended: build-base
	@echo "Building extended image $(IMAGE)..."
	docker build $(CACHE_FLAG) -t $(IMAGE) -f Dockerfile.extended .
	@echo "Build complete: $(IMAGE)"

define RUN_FLAGS
	--name $(CONTAINER) \
	--network host \
	-e DISPLAY=$${DISPLAY} \
	-e ROS_MASTER_URI=$(ROS_MASTER_URI) \
	-e ROS_IP=$(HOST_IP) \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	-v $(WORKSPACE_PATH):/workspace:rw \
	$(if $(filter true,$(USE_NVIDIA)),-e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all,)
endef

run: build
	@echo "Starting $(CONTAINER)..."
	@if [ -n "$${DISPLAY}" ]; then \
		xhost +"local:docker@" 2>/dev/null || echo "Warning: xhost not available"; \
	fi
	docker run -ti --rm \
		$(RUNTIME_FLAG) \
		$(RUN_FLAGS) \
		$(IMAGE) \
		bash

run-detached: build
	@echo "Starting $(CONTAINER) in background..."
	@if [ -n "$${DISPLAY}" ]; then \
		xhost +"local:docker@" 2>/dev/null || echo "Warning: xhost not available"; \
	fi
	docker run -d \
		$(RUNTIME_FLAG) \
		$(RUN_FLAGS) \
		$(IMAGE) \
		tail -f /dev/null
	@echo "Container started. Use 'make shell' to connect."

shell:
	@docker exec -it $(CONTAINER) bash || \
		(echo "Container not running. Start with 'make run-detached'" && exit 1)

stop:
	@docker stop $(CONTAINER) 2>/dev/null || true
	@docker rm $(CONTAINER) 2>/dev/null || true
	@echo "Container stopped."

logs:
	@docker logs -f $(CONTAINER)

clean:
	@echo "Cleaning project resources..."
	@docker ps -a | grep -E '$(IMAGE_NAME)|$(BASE_IMAGE)' | awk '{print $$1}' | xargs -r docker rm -f || true
	@docker images | grep -E '$(IMAGE_NAME)|$(BASE_IMAGE)' | awk '{print $$3}' | xargs -r docker rmi -f || true
	@echo "Project cleanup complete."

clean-all:
	@echo "This will remove ALL Docker containers, images, volumes, and networks!"
	@echo "Press Ctrl+C to cancel, or wait 5 seconds to continue..."
	@sleep 5
	docker rm -f $$(docker ps -aq) 2>/dev/null || true
	docker rmi -f $$(docker images -aq) 2>/dev/null || true
	docker volume prune -f
	docker network prune -f
	docker builder prune -f
	@echo "All Docker resources cleaned."
