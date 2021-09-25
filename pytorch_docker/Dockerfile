FROM pytorch/pytorch:1.9.0-cuda10.2-cudnn7-runtime

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y vim git g++ gcc build-essential 

CMD ["/bin/bash"]
