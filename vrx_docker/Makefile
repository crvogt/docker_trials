.PHONY: build-vrx run-vrx

build-vrx:
	docker build -t vrx_docker .

run-vrx:
	xhost +"local:docker@" && \
        docker run -ti --rm \
	--runtime=nvidia \
	--gpus=all \
        -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson/ \
	--device=/dev/input/js0 \
	vrx_docker
	# --device=/dev/input/js0 \
	# vrx_docker

