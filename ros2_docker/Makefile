.PHONY: build-ros2 run-ros2

build-ros2:
	docker build -t ros2_docker .

run-ros2:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	ros2_docker

