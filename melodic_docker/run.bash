#!/usr/bin/env bash

JOY=/dev/input/js0
PIONEER=/dev/ttyUSB0
CUDA=""
ROCKER_ARGS="--devices $JOY $PIONEER  --dev-helpers --nvidia --x11 --user --home --git"

while getopts ":cstxh" option; do
  case $option in
    c) # enable cuda library support 
      CUDA="--cuda ";;
    s) # Build cloudsim image
      ROCKER_ARGS="--nvidia --novnc --turbovnc --user --user-override-name=developer";;
    t) # Build test image for Continuous Integration 
      echo "Building CI image"
      ROCKER_ARGS="--dev-helpers --nvidia";;
    x) # Build VRX Competition base image
      echo "Building VRX Competition server base image"
      ROCKER_ARGS="--dev-helpers --devices $JOY --nvidia --x11 --user --user-override-name=developer";;
    h) # print this help message and exit
      Help
      exit;; 
  esac
done

IMG_NAME=melodic_docker

# Replace `:` with `_` to comply with docker container naming
# And append `_runtime`
CONTAINER_NAME="$(tr ':' '_' <<< "$IMG_NAME")_runtime"
ROCKER_ARGS="${ROCKER_ARGS} --name $CONTAINER_NAME"
echo "Using image <$IMG_NAME> to start container <$CONTAINER_NAME>"

rocker ${CUDA} ${ROCKER_ARGS} $IMG_NAME 
