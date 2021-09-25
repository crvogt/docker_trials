FROM gazebo:libgazebo11-focal 
#FROM gazebo:gzserver8

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

#ENV DEBIAN_FRONTEND=noninteractive

RUN apt update

RUN apt install -y vim git

CMD ["/bin/bash"]
