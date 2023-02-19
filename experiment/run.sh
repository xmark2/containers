#!/bin/sh

case $1 in
"image")
  echo "Creating welcome builder image"
  cd exp1
  docker image build -t ubu:v1 .
  cd ..
esac

case $1 in
"cont")
  echo "Running container"
  docker run -it --name ubu_cont ubu:v1 bash
esac

case $1 in
"cont-d")
  echo "Running container in detached mode"
  docker run -itd --name ubu_cont ubu:v1 bash
esac

case $1 in
"cont-v")
  echo "Running container in detached mode"
  cd exp1
  docker run -itd --name ubu_cont -v $(pwd)/code:/code ubu:v1
  docker run -itd --name ubu_cont2 -v $(pwd)/code:/code ubu:v1
  cd ..
esac

case $1 in
"rmc")
  echo "removing containers"
  docker rm $(docker ps -a -q)
esac

case $1 in
"stop")
  echo "stop all containers"
  docker stop $(docker ps -a -q)
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