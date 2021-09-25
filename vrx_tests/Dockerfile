FROM ros:noetic-ros-base-focal

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update
RUN apt-get install -y vim git g++ gcc build-essential gazebo11 libgazebo11-dev \
ros-noetic-xacro ros-noetic-geographic-msgs ros-noetic-gazebo-ros 

CMD ["/bin/bash"]
