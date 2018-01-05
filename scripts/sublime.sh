#!/bin/sh -eux

# # # but not libreoffice
# # sudo apt-get -y remove --purge libreoffice*
# # sudo apt-get autoclean # removes .deb files for packages no longer installed on your system

# # sublime ftw. if you don't own a license already, please support!
sudo -E add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get -y update
sudo apt-get -y install sublime-text-installer

sudo apt-get -f -y install

