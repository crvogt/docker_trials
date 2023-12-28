.PHONY: build-humble run-humble

build-humble:
	docker build -t humble_docker .

run-humble:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	humble_docker

