#!/bin/sh -eux
# Install Docker
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get -y -f install
sudo apt-get purge lxc-docker
sudo apt-get update
sudo apt-get -y install docker-engine
# start docker
sudo server docker start
# add the vagrant user to the docker group
sudo groupadd docker
sudo usermod -aG docker vagrant
# start on boot
sudo systemctl enable docker

