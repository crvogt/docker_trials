FROM osrf/ros:humble-desktop-full

# Set Ubuntu release
#ARG RELEASE=focal

# Set ROS distribution
ARG DIST=humble

# Set Gazebo version
#ARG GAZ=gazebo11

# Required utilities
RUN apt update \
 && apt install -y --no-install-recommends\
        build-essential \
        cmake \
        cppcheck \
        curl \
        git \
        gnupg \
        libeigen3-dev \
        libgles2-mesa-dev \
        lsb-release \
        pkg-config \
        protobuf-compiler \
        python3-dbg \
        python3-pip \
        python3-scipy \
        python3-venv \
        qtbase5-dev \
        ruby \
        software-properties-common \
        sudo \
        wget \
 && apt clean

# Fixing TimeZone problem reported in VRX 2019
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt update \
 && apt install -y \
    tzdata \
 && ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && apt clean

# Install ros and gazebo packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-${DIST}-turtlebot4-base \
    ros-${DIST}-turtlebot4-bringup \
    ros-${DIST}-turtlebot4-navigation \
    ros-${DIST}-turtlebot4-viz \
    ros-${DIST}-turtlebot4-tutorials \
    ros-${DIST}-turtlebot4-ignition-bringup 

# Optional: Dev. tools, applications, etc.
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdb \
    psmisc \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && apt upgrade -y

