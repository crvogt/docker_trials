FROM nvidia/cuda:11.4.1-devel-ubuntu20.04 

#ENV UBUNTU_RELEASE=focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y lsb-release && apt-get clean all

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN apt-get install -y curl # if you haven't already installed curl

RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN apt update

RUN apt install -y ros-noetic-desktop-full

RUN apt-get install -y vim git g++ gcc build-essential dbus-x11 gazebo11 libgazebo11-dev \
ros-noetic-xacro ros-noetic-geographic-msgs ros-noetic-gazebo-ros x11-apps

#RUN apt upgrade -y

#RUN source /opt/ros/noetic/setup.bash

CMD ["/bin/bash"]
