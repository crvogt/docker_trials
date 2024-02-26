.PHONY: build-galactic run-galactic

build-galactic:
	docker build -t galactic_docker .

run-galactic:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	--device=/dev/input/js0 \
	galactic_docker

