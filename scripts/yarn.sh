#!/bin/bash
## Install Yarn 

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python-dev npm yarn

# install core components including Node.js, flow and react-native
sudo npm intall -g n
sudo n latest
sudo npm install -g npm@latest

# watchman will need more memory for file watches
echo fs.inotify.max_user_watches=16384 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

