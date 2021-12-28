FROM ubuntu:focal

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y vim git g++ gcc build-essential 
RUN apt-get install -y libfreetype6-dev libboost-date-time-dev libboost-thread-dev nvidia-cg-toolkit \
    libfreeimage-dev zlib1g-dev libzzip-dev libois-dev libcppunit-dev doxygen libxt-dev libxaw7-dev \ 
    libxxf86vm-dev libxrandr-dev libglu-dev cmake

# RUN git clone -b v1.9.1 --single-branch https://github.com/ogrecave/ogre /home/carson/libs/ogre1.9

CMD ["/bin/bash"]
