#!/bin/sh -eux
# Install Ruby, Git, Node, Postgres, and Redis

# skip this, but if using behind a firewall you'll want these
# echo 'Acquire::http::Proxy "http://proxy";
# Acquire::https::Proxy "http://proxy";' | sudo cat /etc/apt/apt.conf
#
# sudo rm -rf /etc/wgetrc
# echo "http_proxy = http://proxy
# https_proxy = http://proxy" | sudo tee /etc/wgetrc
# sudo chmod 755 /etc/wgetrc
#
# sudo rm -rf /etc/curlrc
# echo 'user-agent="foo;"
# proxy=http://proxy' | sudo tee /etc/curlrc
# sudo chmod 755 /etc/curlrc

# behind a proxy, use this but add your proxy
# sudo -H -u vagrant bash -c 'gpg --keyserver-options http-proxy=http://proxy --keyserver hkp://keys.gnupg.net:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
# sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# # behind a proxy, use this but add your proxy
# # sudo -H -u vagrant bash -c 'curl -x http://proxy -sSL https://get.rvm.io | bash -s stable'
# sudo -H -u vagrant bash -c '\curl -sSL https://get.rvm.io | bash -s stable'


