.PHONY: build-gz run-gz

build-gz:
	docker build -t gz_docker .

run-gz:
	xhost +"local:docker@" && \
        docker run -ti --rm \
	--runtime=nvidia \
	--gpus=all \
        -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson/ \
	--device=/dev/input/js0 \
	gz_docker
	# --device=/dev/input/js0 \
	# vrx_docker

