.PHONY: build-pr2 run-pr2

build-pr2:
	docker build -t pr2_docker .

run-pr2:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	pr2_docker

