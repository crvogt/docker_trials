.PHONY: build-focv run-focv

build-focv:
	docker build -t focv_docker .

run-focv:
	xhost +"local:docker@" && \
		docker run -ti --rm \
		-e DISPLAY=${DISPLAY} \
	--runtime=nvidia \
	--gpus=all \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson:/home/carson \
	focv_docker
