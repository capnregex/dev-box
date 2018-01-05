#!/bin/sh -eux

# put an awesome font in the font cache
mkdir -p /home/vagrant/.fonts
chown vagrant:vagrant /home/vagrant/.fonts
cd /home/vagrant/.fonts
wget https://github.com/powerline/fonts/raw/master/DroidSansMonoSlashed/Droid%20Sans%20Mono%20Slashed%20for%20Powerline.ttf
chown vagrant:vagrant Droid\ Sans\ Mono\ Slashed\ for\ Powerline.ttf
sudo fc-cache -f -v

