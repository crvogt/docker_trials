#FROM ubuntu:18.04
FROM ros:noetic-ros-base-focal

# Set Ubuntu release
ARG RELEASE=focal

# Set ROS distribution
ARG DIST=noetic

# Set Gazebo version
ARG GAZ=gazebo11

	# user settings
ENV HOME=/home/user \
	USER_NAME=user \
	USER_UID=1000 \
	USER_SHELL=/bin/bash \
	USER_SUDOER=yes \
	# vnc settings
	VNC_DPI=100 \
	VNC_GEOMETRY=1920x1080 \
	VNC_PASS=changeme \
	# default language
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US:en \
	LC_ALL=en_US.UTF-8 \
	# init default version
	TINI_VERSION=v0.18.0 \
	TIGERVNC_VERSION=1.9.0 \
	DOCKER_COMPOSE_VERSION=1.24.1 \
	# non interactive mode
	DEBIAN_FRONTEND=noninteractive

RUN set -ex \
	&& apt-get update && apt-get install --no-install-recommends -y \
	# vnc dependencies
	build-essential \
	cmake \
	cppcheck \
	gnupg \
	libeigen3-dev \
	libgles2-mesa-dev \
	lsb-release \
	pkg-config \
	protobuf-compiler \
	vim \
	wget \
	locales \
	bzip2 \
	sudo \
	gosu \
	zsh \
	git \
	curl \
	apt-transport-https \
	ca-certificates \ 
	gnupg-agent \
	software-properties-common \
	tmux \
	# x11
	xfonts-base \
	xserver-xorg-input-all \
	xinit \
	xserver-xorg \
	xserver-xorg-video-all \
	x11-xserver-utils \
	libgtk2.0-common \
	xclip \
	dbus-x11 \
	fonts-noto-color-emoji \
	# terminal
	xfce4-terminal \
	# windows manager
	i3 \
	# python dependencies
	python3 \
	python3-pip \
	python3-setuptools \
	python3-dbg \
	python3-scipy \
	python3-venv \
	qtbase5-dev \
	ruby \
	# python modules
	&& pip3 install --upgrade pyyaml \
	# vnc server
	&& wget -qO- https://sourceforge.net/projects/tigervnc/files/stable/1.9.0/tigervnc-1.9.0.x86_64.tar.gz | tar xz --strip 1 -C / \
	# docker cli & docker-compose (for docker in docker purposes)
	&& curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
	&& add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
	&& apt-get update && apt-get install --no-install-recommends -y docker-ce-cli \
	# docker compose
	&& curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose \
	&& chmod +x /usr/bin/docker-compose \
	# configure locale
	&& locale-gen ${LC_ALL} \
	# cleanup
	&& apt-get remove -y apt-transport-https gnupg-agent software-properties-common \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*

# Fix timezone issue
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
		ros-${DIST}-moveit* \	
		ros-${DIST}-robot-localization \	
		ros-${DIST}-robot-state-publisher \	
		ros-${DIST}-ros-base \	
		ros-${DIST}-ros-controllers \	
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
	# && apt-get remove -y apt-transport-https gnupg-agent software-properties-common \
	# && apt-get autoremove -y \
	# && rm -rf /var/lib/apt/lists/* \
	# && rm -rf /tmp/*

COPY rootfs/ /
COPY vimrc /home/user/.vimrc
COPY tmux.conf /home/user/.tmux.conf

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini 

ENTRYPOINT ["/tini", "-v", "--", "/usr/local/bin/docker-entrypoint"]

WORKDIR $HOME

#CMD ["vncstart", "0", "xfce4-terminal", "--wait"]
CMD ["vncstart", "0", "--wait"]
