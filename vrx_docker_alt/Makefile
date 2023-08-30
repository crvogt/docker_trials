.PHONY: build-vrx-alt run-vrx-alt

build-vrx-alt:
	docker build -t vrx_docker_alt .

run-vrx-alt:
	xhost +"local:docker@" && \
        docker run -ti --rm \
	--runtime=nvidia \
	--gpus=all \
        -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson/ \
	vrx_docker_alt
	# --device=/dev/input/js0 \
	# vrx_docker

