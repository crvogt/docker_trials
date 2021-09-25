.PHONY: build-pytorch run-pytorch

build-pytorch:
	docker build -t pytorch_docker .

run-pytorch:
	xhost +"local:docker@" && \
        docker run -ti --rm \
	--runtime=nvidia \
	--gpus=all \
        -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson/pytorch_ws:/home/carson/pytorch_ws \
	pytorch_docker

