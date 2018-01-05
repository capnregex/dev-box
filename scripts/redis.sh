#!/bin/sh -eux

# install redis
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04
cd ~
wget http://download.redis.io/redis-stable.tar.gz
tar xzf redis-stable.tar.gz
cd redis-stable
make
# make test
sudo make install
cd utils
# install non-interactively with defaults
echo -n | sudo ./install_server.sh

sudo service redis_6379 start
# other commands include:
# sudo service redis_6379 stop
# sudo service redis_6379 status

sudo rm -rf ~/redis-*

