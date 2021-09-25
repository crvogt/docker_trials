FROM ros:melodic-ros-core-bionic

# Install ROS packages
RUN apt-get update && apt-get install -y \
	ros-melodic-ros-base=1.4.1-0* \
	&& rm -rf /var/lib/apt/lists/*

# Copy over script to Docker container
# COPY ./run_my_system.bash /

# User your ros_entrypoint
 COPY ./ros_entrypoint.sh /
