# Image names
ROS_IMAGE = ros-core:noetic-l4t

# Container names
ROS_CONTAINER = ros-core
HOST_IP=127.0.0.1

.PHONY: all build build-ros run-ros stop-ros clean

all: run-ros

build-ros:
	docker build -t $(ROS_IMAGE) .

build: build-ros

run-ros:
	xhost +"local:docker@" && \
	docker run -ti --rm \
	--runtime=nvidia \
	--name $(ROS_CONTAINER) \
	--network host \
	-e DISPLAY=${DISPLAY} \
	-e NVIDIA_VISIBLE_DEVICES=all \
	-e NVIDIA_DRIVER_CAPABILITIES=all \
	-e ROS_MASTER_URI=http://$(HOST_IP):11311 \
	-e ROS_IP=$(HOST_IP) \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	--device /dev/ttyUSB0:/dev/ttyUSB0 \
	--privileged \
	--security-opt seccomp=unconfined \
	$(ROS_IMAGE)

stop-ros:
	docker rm -f $(ROS_CONTAINER) || true

clean:
	docker rm -f $(shell docker ps -aq) || true
	docker rmi -f $(shell docker images -aq) || true
	docker volume prune -f
	docker network prune -f
