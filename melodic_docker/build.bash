#!/usr/bin/env bash

# Builds a Docker image.
image_name=melodic_docker

if [ ! -f Dockerfile ]
then
    echo "Err: Directory does not contain a Dockerfile to build."
    exit 1
fi

image_plus_tag=$image_name
docker build -t $image_plus_tag .
