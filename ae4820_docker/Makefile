.PHONY: build-lab run-lab

build-lab:
	docker build -t lab_docker .

run-lab:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	--device=/dev/input/js0 \
	lab_docker

