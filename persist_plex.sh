#!/bin/bash

# Copy config files from container to host
if [ ! -d config ]; then
  docker cp $(docker ps -a | grep plex | awk -F ' ' '{print $1}'):/config ./config
fi

# Mount config files in docker-compose
if [ -z $(cat docker-compose.yml | grep config) ]; then
  echo "      - /config:/config" >> docker-compose.yml
fi

# Restart Plex
sudo service plex restart

# Pop open website
firefox localhost:32400/web
