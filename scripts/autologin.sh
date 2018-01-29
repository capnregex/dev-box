#!/bin/sh -eux
# run as root

# https://help.ubuntu.com/community/AutoLogin

mkdir -p /etc/lightdm/lightdm.conf.d
cat <<AUTOLOGIN > /etc/lightdm/lightdm.conf.d/50-myconfig.conf
[SeatDefaults]
autologin-user=vagrant
AUTOLOGIN

