.PHONY: build-dai run-dai

build-dai:
	docker build -t dai_docker .

run-dai:
	xhost +"local:docker@" && \
        docker run -ti --rm \
        -e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--privileged \
	-v /dev/bus/usb:/dev/bus/usb \
	--device-cgroup-rule='c 189:* rmw' \
	--gpus=all \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	dai_docker

