FROM osrf/ros:noetic-desktop-full-focal

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y vim git g++ gcc build-essential 
RUN apt-get install -y ros-noetic-hector-gazebo-plugins
RUN apt-get install -y gazebo11 libgazebo11-dev ros-noetic-xacro ros-noetic-geographic-msgs \
 ros-noetic-gazebo-ros ros-noetic-teleop-twist-keyboard
RUN apt-get install -y ros-noetic-joy ros-noetic-joy-teleop libignition-common3-graphics 

CMD ["/bin/bash"]
