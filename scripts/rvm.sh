#!/bin/sh -eux

# Setup gnupg so we can install RVM per below
mkdir -p /home/vagrant/.gnupg
sudo chown -R vagrant:vagrant /home/vagrant/.gnupg
sudo chmod 700 /home/vagrant/.gnupg

# Import keys as root
sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

command curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -

# make sure the files inside the .gnupg have the correct permissions
sudo chmod 600 /home/vagrant/.gnupg/*
sudo chown -R vagrant:vagrant /home/vagrant/.gnupg

# Install rvm as vagrant
sudo -H -u vagrant bash -c '\curl -sSL https://get.rvm.io | bash -s stable'

