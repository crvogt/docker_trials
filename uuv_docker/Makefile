.PHONY: build-uuv run-uuv

build-uuv:
	docker build -t uuv_docker .

run-uuv:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--device=/dev/video2 \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	uuv_docker

