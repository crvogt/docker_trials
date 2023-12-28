FROM ros:melodic-ros-base-bionic

# Set Ubuntu release
ARG RELEASE=bionic

# Set ROS distribution
ARG DIST=melodic

# Set Gazebo version
ARG GAZ=gazebo9

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

# Get ROS and Gazebo
RUN apt update \ 
 && apt install -y --no-install-recommends \
    ${GAZ} \
    lib${GAZ}-dev \
    ros-${DIST}-gazebo-plugins \
    ros-${DIST}-gazebo-ros \
    ros-${DIST}-gazebo-ros-control \
    ros-${DIST}-gazebo-ros-pkgs \
    ros-${DIST}-effort-controllers \
 && apt clean

COPY .vimrc /root/

RUN apt update && apt upgrade -y

# Optional: Dev. tools, applications, etc.
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdb \
    psmisc \
    vim \
    && rm -rf /var/lib/apt/lists/*

