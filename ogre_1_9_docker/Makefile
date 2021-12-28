.PHONY: build-ogre run-ogre

build-ogre:
	docker build -t ogre_docker .

run-ogre:
	xhost +"local:docker@" && \
        docker run -ti --rm \
	--runtime=nvidia \
	--gpus=all \
        -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson/libs:/home/carson/libs \
	ogre_docker

