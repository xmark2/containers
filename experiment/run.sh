#!/bin/sh

case $1 in
"image")
  echo "Creating welcome builder image"
  docker image build -t pyimage:v1 .
esac

case $1 in
"container")
  echo "Running container"
  docker run --name pycont pyimage:v1
esac


case $1 in
"info")
  docker ps
  docker ps -a
  docker images
esac


case $1 in
"dangling")
  docker image prune
esac


case $1 in
"prune")
  docker system prune -fa
esac
#string1=$1
#
#if [ $1 == "image" ]; then
#    echo "image"
#elif [ $1 == "container" ]; then
#    echo "container"
#fi

#docker image build -t welcome-builder:v1 -f Dockerfile.build .