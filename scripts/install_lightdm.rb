#!/bin/sh 
# run as root
# https://xpressubuntu.wordpress.com/2014/02/22/how-to-install-a-minimal-ubuntu-desktop/

apt-get update && apt-get upgrade

#Lets ensure we configure our system to not install suggested packages or recommended packages:
mkdir -p /etc/apt
cat <<APTCONF > apt.conf
APT::Install-Recommends "0";
APT::Install-Suggests "0";
APTCONF

# Lets now install the basic graphics stack:
apt-get install -y xserver-xorg xserver-xorg-core xfonts-base xinit x11-xserver-utils
apt-get install -y xfwm4 xfce4-panel xfce4-settings xfce4-session xfce4-terminal xfdesktop4 xfce4-taskmanager tango-icon-theme
apt-get install -y lightdm lightdm-gtk-greeter

