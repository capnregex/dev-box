#!/bin/sh -eux
# run as root
# https://xpressubuntu.wordpress.com/2014/02/22/how-to-install-a-minimal-ubuntu-desktop/

mkdir -p /etc/apt
cat <<CONF >> apt.conf
APT::Install-Recommends "0";
APT::Install-Suggests "0";
CONF

