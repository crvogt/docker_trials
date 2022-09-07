.PHONY: build-orb run-orb

build-orb:
	docker build -t orb_docker .

run-orb:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	--device=/dev/video0 \
	orb_docker

