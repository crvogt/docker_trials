.PHONY: build-humble run-humble

build-humble:
	docker build -t humble_docker .

run-humble:
	xhost +"local:docker@" && \
        nvidia-docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	--device=/dev/input/js0 \
	humble_docker

