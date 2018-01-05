#!/bin/sh -eux

# Install rvm as vagrant
sudo -H -u vagrant bash -c '\curl -sSL https://get.rvm.io | bash -s stable'

# Include rvm in bash
echo "source $HOME/.rvm/scripts/rvm" >> /home/vagrant/.bash_profile

