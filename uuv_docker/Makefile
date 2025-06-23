.PHONY: build-uuv run-uuv

build-uuv:
	docker build -t uuv_docker .

run-uuv:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--privileged \
	--gpus=all \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/ttyUSB0:/dev/ttyUSB0 \
	-v /home/carson:/home/carson \
	--device=/dev/input/js0 \
	uuv_docker

