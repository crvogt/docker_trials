FROM ros:noetic-ros-base

# Set Ubuntu release
ARG RELEASE=focal

# Set ROS distribution
ARG DIST=noetic

# Set Gazebo version
ARG GAZ=gazebo11

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
ENV DEBIAN_FRONTEND=noninteractive

# Required utilities 
RUN apt update \
 && apt install -y --no-install-recommends \
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
        python3-venv \
        python3-numpy \
        qtbase5-dev \
        ruby \
        software-properties-common \
        sudo \
        wget \
        vim \
 && apt clean

RUN apt update && apt install -y tzdata \
 && ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && apt clean

# Get ROS and Gazebo
RUN /bin/sh -c 'echo "deb http://packages.ros.org/ros/ubuntu ${RELEASE} main" > /etc/apt/sources.list.d/ros1-latest.list' \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
 && /bin/sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable ${RELEASE} main" > /etc/apt/sources.list.d/gazebo-stable.list' \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2486D2DD83DB69272AFE98867170598AF249743 \
 && apt update \
 && apt install -y --no-install-recommends \
    ${GAZ} \
    lib${GAZ}-dev \
    ros-${DIST}-gazebo-plugins \
    ros-${DIST}-gazebo-ros \
    ros-${DIST}-gazebo-ros-control \
    ros-${DIST}-gazebo-ros-pkgs \
    ros-${DIST}-effort-controllers \
    ros-${DIST}-geographic-info \
    ros-${DIST}-hector-gazebo-plugins \
    ros-${DIST}-joint-state-controller \
    ros-${DIST}-joint-state-publisher \
    ros-${DIST}-joy \
    ros-${DIST}-joy-teleop \
    ros-${DIST}-kdl-parser-py \
    ros-${DIST}-key-teleop \
    ros-${DIST}-move-base \
    ros-${DIST}-robot-localization \
    ros-${DIST}-robot-state-publisher \
    ros-${DIST}-ros-base \
    ros-${DIST}-rqt \
    ros-${DIST}-rqt-common-plugins \
    ros-${DIST}-rqt-robot-plugins \
    ros-${DIST}-rviz \
    ros-${DIST}-teleop-tools \
    ros-${DIST}-teleop-twist-joy \
    ros-${DIST}-teleop-twist-keyboard \
    ros-${DIST}-tf2-geometry-msgs \
    ros-${DIST}-tf2-tools \
    ros-${DIST}-urdfdom-py \
    ros-${DIST}-velodyne-gazebo-plugins \
    ros-${DIST}-velodyne-simulator \
    ros-${DIST}-xacro \
 && apt clean

RUN apt-get update -y --no-install-recommends

CMD ["/bin/bash"]
