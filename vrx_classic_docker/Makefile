.PHONY: build-vrx-classic run-vrx-classic

build-vrx-classic:
	docker build -t vrx_classic_docker .

run-vrx-classic:
	xhost +"local:docker@" && \
        docker run -ti --rm \
	--runtime=nvidia \
	--gpus=all \
        -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson/ \
	--device=/dev/input/js0 \
	vrx_classic_docker

