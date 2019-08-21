#!/bin/bash

# Install Docker
if [ "$(docker -v)" != "Docker version"* ]; then
  package_manager=$(if [[ ! -z $(which yum) ]]; then echo "yum"; elif [[ ! -z $(which apt-get) ]]; then echo "apt-get"; fi)
  sudo $package_manager install docker -y
  sudo systemctl enable docker
  sudo service docker start
  sudo usermod -aG docker $(whoami)
fi

# Install docker-compose
if [ "$(docker-compose -v)" != "docker-compose version"* ]; then
  echo "Downloading docker-compose..."
  curl -L https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m) -o /bin
  chmod 755 /bin/docker-compose
  echo "Done..."
fi

# Mount media storage
if [ "$(cat /etc/fstab | grep USB_Storage)" != *"USB_Storage"* ]; then
  sudo echo "//192.168.1.1/USB_Storage /media/USB_Storage cifs guest,x-systemd.automount 0 0" >> /etc/fstab
fi
sudo mount -a

# Set init.d script to start at boot
sudo cp plex /etc/init.d/
sudo sed -i 's/SED_ME/docker_compose_dir='$(git rev-parse --show-toplevel)'/g' /etc/init.d/plex
sudo chmod 755 /etc/init.d/plex
sudo chkconfig --add plex
sudo systemctl enable plex

# Start Plex
sudo service start plex

# Pop open website
firefox localhost:32400/web
