FROM osrf/ros:noetic-desktop-focal

# Set Ubuntu release
ARG RELEASE=focal

# Set ROS distribution
ARG DIST=noetic

# Set Gazebo version
ARG GAZ=gazebo11

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
        libgstreamer1.0-dev \
        libgstreamer-plugins-base1.0-dev \
        libgstreamer-plugins-good1.0-0 \
        libgstreamer-plugins-good1.0-dev \
        gstreamer1.0-plugins-good \
        lsb-release \
        pkg-config \
        protobuf-compiler \
        python3-dbg \
        python3-pip \
        python3-scipy \
        python3-venv \
        python-is-python3 \
        qtbase5-dev \
        ruby \
        software-properties-common \
        sudo \
        wget \
 && apt clean

RUN apt update && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update

RUN apt install -y --no-install-recommends \
    python3.10-venv python3.10-dev

# Fixing TimeZone problem reported in VRX 2019
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt update \
 && apt install -y \
    tzdata \
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
    python3-catkin-tools \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-vcstool \
    ros-${DIST}-apriltag* \
    ros-${DIST}-cmvision \
    ros-${DIST}-depthai-ros \
    ros-${DIST}-driver-base \
    ros-${DIST}-gazebo-plugins \
    ros-${DIST}-gazebo-ros \
    ros-${DIST}-gazebo-ros-control \
    ros-${DIST}-gazebo-ros-pkgs \
    ros-${DIST}-effort-controllers \
    ros-${DIST}-geographic-info \
    ros-${DIST}-hector-gazebo-plugins \
    ros-${DIST}-husky-navigation \
    ros-${DIST}-husky-gazebo \
    ros-${DIST}-husky-viz \
    ros-${DIST}-image-view \
    ros-${DIST}-joint-state-controller \
    ros-${DIST}-joint-state-publisher \
    ros-${DIST}-joy \
    ros-${DIST}-joy-teleop \
    ros-${DIST}-kdl-parser-py \
    ros-${DIST}-key-teleop \
    ros-${DIST}-move-base \
    ros-${DIST}-moveit* \
    ros-${DIST}-rgbd-launch \
    ros-${DIST}-robot-localization \
    ros-${DIST}-robot-state-publisher \
    ros-${DIST}-ros-base \
    ros-${DIST}-ros-controllers \
    ros-${DIST}-rosbridge-suite \
    ros-${DIST}-rosserial \
    ros-${DIST}-rplidar-ros \
    ros-${DIST}-rqt \
    ros-${DIST}-rqt-common-plugins \
    ros-${DIST}-rqt-robot-plugins \
    ros-${DIST}-rviz \
    ros-${DIST}-teleop-tools \
    ros-${DIST}-teleop-twist-joy \
    ros-${DIST}-teleop-twist-keyboard \
    ros-${DIST}-tf2-geometry-msgs \
    ros-${DIST}-tf2-tools \
    ros-${DIST}-tf* \
    ros-${DIST}-urdfdom-py \
    ros-${DIST}-usb-cam \
    ros-${DIST}-velodyne-gazebo-plugins \
    ros-${DIST}-velodyne-simulator \
    ros-${DIST}-xacro \
 && apt clean

RUN python3 -m pip install conan
RUN python3 -m pip install conan==1.59
RUN conan config set general.revisions_enabled=1
RUN conan profile new default --detect > /dev/null
RUN conan profile update settings.compiler.libcxx=libstdc++11 default

COPY .vimrc /root/

RUN apt update && apt upgrade -y

# Optional: Dev. tools, applications, etc.
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdb \
    psmisc \
    vim \
    && rm -rf /var/lib/apt/lists/*

