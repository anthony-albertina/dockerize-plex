#!/bin/bash

# Install Docker
./install_docker.sh

# Install docker-compose
./install_docker_compose.sh

# Get Plex Dockerfile
wget https://raw.githubusercontent.com/plexinc/pms-docker/master/Dockerfile # Gets one file rather than cloning whole repo

# Build Plex docker image

# Mount media storage
sudo echo "//192.168.1.1/USB_Storage /media/USB_Storage cifs guest,x-systemd.automount 0 0" >> /etc/fstab
sudo mount -a

# Start Plex
./start_plex.sh
