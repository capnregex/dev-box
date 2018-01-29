#!/bin/sh -eux

case "$PACKER_BUILDER_TYPE" in
virtualbox-iso|virtualbox-ovf)
    mkdir -p /tmp/vbox;
    mount /dev/sr0 /tmp/vbox;
    sh /tmp/vbox/VBoxLinuxAdditions.run \
        || echo "VBoxLinuxAdditions.run exited $? and is suppressed." \
            "For more read https://www.virtualbox.org/ticket/12479";
    umount /tmp/vbox;
    rm -rf /tmp/vbox;
    ;;
esac
