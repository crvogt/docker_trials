.PHONY: build-uuv run-uuv

build-uuv:
	docker build -t uuv_docker .

run-uuv:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson/uuv_ws:/home/carson/uuv_ws \
	-v /home/carson/moveit_ws:/home/carson/moveit_ws \
	-v /home/carson:/home/carson \
	--device=/dev/input/js0 \
	uuv_docker

