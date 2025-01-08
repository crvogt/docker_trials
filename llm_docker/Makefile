.PHONY: build-llm run-llm

build-llm:
	docker build -t llm_docker .

run-llm:
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
	llm_docker

