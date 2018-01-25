#!/bin/sh -eux

df -h
exit

#    virtualbox-iso: Filesystem                    Size  Used Avail Use% Mounted on
#    virtualbox-iso: udev                          468M     0  468M   0% /dev
#    virtualbox-iso: tmpfs                          99M  1.9M   97M   2% /run
#    virtualbox-iso: /dev/mapper/vagrant--vg-root   38G  1.8G   34G   6% /
#    virtualbox-iso: tmpfs                         493M     0  493M   0% /dev/shm
#    virtualbox-iso: tmpfs                         5.0M     0  5.0M   0% /run/lock
#    virtualbox-iso: tmpfs                         493M     0  493M   0% /sys/fs/cgroup
#    virtualbox-iso: tmpfs                          99M     0   99M   0% /run/user/1000


# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/home/vagrant}";

case "$PACKER_BUILDER_TYPE" in
virtualbox-iso|virtualbox-ovf)
    ISO="VBoxGuestAdditions.iso";
    mkdir -p /tmp/vbox;
    mount -o loop $HOME_DIR/$ISO /tmp/vbox;
    sh /tmp/vbox/VBoxLinuxAdditions.run \
        || echo "VBoxLinuxAdditions.run exited $? and is suppressed." \
            "For more read https://www.virtualbox.org/ticket/12479";
    umount /tmp/vbox;
    rm -rf /tmp/vbox;
    rm -f $HOME_DIR/*.iso;
    ;;
esac
