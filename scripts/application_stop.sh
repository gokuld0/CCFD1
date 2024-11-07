#!/bin/bash

echo "This Script is used to stop already running docker containers, remove them, and remove the images as well"

# Stop all running containers
sudo docker stop $(sudo docker ps -q)

# Remove all containers
sudo docker rm $(sudo docker ps -a -q)

# Remove all images
sudo docker rmi $(sudo docker images -q)
