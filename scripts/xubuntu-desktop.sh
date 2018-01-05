#!/bin/sh -eux

# install a lightweight desktop
sudo apt-get -y install xubuntu-desktop --no-install-recommends
sudo apt-get -y install xfce4-terminal
sudo apt-get -y install xfce4-screenshooter xfce4-whiskermenu-plugin xfpanel-switch xfce4-taskmanager xfce4-quicklauncher-plugin xfce4-indicator-plugin ristretto mugshot libxfce4ui-utils file-roller xfce4-clipman-plugin xfce4-linelight-plugin thunar-archive-plugin xfce4-power-manager gtk3-engines-xfce
sudo apt-get -y install qpdfview # pdf viewer

