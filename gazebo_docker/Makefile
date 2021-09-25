.PHONY: run-vrx build-vrx

build-vrx:
	docker build -t gazebo_dock .

run-vrx:
	xhost +"local:docker@" && \
        nvidia-docker run -ti --rm \
	--runtime=nvidia \
	--gpus=all \
	--env NVIDIA_DISABLE_REQUIRE=1 \
        -e DISPLAY=${DISPLAY} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/carson/vrx_ws:/home/carson/vrx_ws \
	gazebo_dock

