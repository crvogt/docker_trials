.PHONY: build-tb4 run-tb4

build-tb4:
	docker build -t tb4_docker .

run-tb4:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	tb4_docker

