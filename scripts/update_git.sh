#!/bin/sh -eux

# Install newer version of git
sudo apt-get -y install git # should be at least 2.9.0

# this forces install of some missing support packages, may not be necessary
# but was when tested manually
sudo apt-get -y -f install

