#!/bin/sh -eux

# Download no additional languages
sudo touch /etc/apt/apt.conf.d/00aptitude
echo 'Acquire::Languages "none";' | sudo cat /etc/apt/apt.conf.d/00aptitude

