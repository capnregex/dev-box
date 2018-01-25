#!/bin/sh -eux
# run as root

sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers;

# Set up password-less sudo for the vagrant user
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >/etc/sudoers.d/99_vagrant;
chmod 440 /etc/sudoers.d/99_vagrant;

# # never manually edit sudoers file. except now
sed -i '/Defaults\senv_reset/ a\Defaults\tenv_keep +="HTTP_PROXY"' /etc/sudoers
sed -i '/Defaults\senv_reset/ a\Defaults\tenv_keep +="HTTPS_PROXY"' /etc/sudoers
sed -i '/Defaults\senv_reset/ a\Defaults\tenv_keep +="NO_PROXY"' /etc/sudoers
sed -i '/Defaults\senv_reset/ a\Defaults\tenv_keep +="http_proxy"' /etc/sudoers
sed -i '/Defaults\senv_reset/ a\Defaults\tenv_keep +="https_proxy"' /etc/sudoers
sed -i '/Defaults\senv_reset/ a\Defaults\tenv_keep +="no_proxy"' /etc/sudoers

