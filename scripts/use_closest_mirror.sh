#!/bin/sh -eux
# run script as root

# which version of ubuntu
# https://help.ubuntu.com/community/CheckingYourUbuntuVersion
codename=`lsb_release -sc`

# https://askubuntu.com/questions/39922/how-do-you-select-the-fastest-mirror-from-the-command-line
echo Configure apt to use closest mirror
mkdir -p /etc/apt
cat <<SOURCES > /etc/apt/sources.list
deb mirror://mirrors.ubuntu.com/mirrors.txt $codename main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt $codename-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt $codename-backports main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt $codename-security main restricted universe multiverse
SOURCES

