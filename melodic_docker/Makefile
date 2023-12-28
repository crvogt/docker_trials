.PHONY: build-melodic run-melodic

build-melodic:
	docker build -t melodic_docker .

run-melodic:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	melodic_docker

