#!/bin/sh -eux
# run as root
# https://xpressubuntu.wordpress.com/2014/02/22/how-to-install-a-minimal-ubuntu-desktop/

mkdir -p /etc/apt
cat <<CONF >> /etc/apt/apt.conf
APT::Install-Recommends "0";
APT::Install-Suggests "0";
CONF

mkdir -p /etc/dpkg/dpkg.cfg.d
cat << NODOC > /etc/dpkg/dpkg.cfg.d/01_nodoc
path-exclude /usr/share/doc/*
# we need to keep copyright files for legal reasons
path-include /usr/share/doc/*/copyright
path-exclude /usr/share/man/*
path-exclude /usr/share/groff/*
path-exclude /usr/share/info/*
# lintian stuff is small, but really unnecessary
path-exclude /usr/share/lintian/*
path-exclude /usr/share/linda/*
NODOC

