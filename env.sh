#!/bin/sh

export VBOX_USER_HOME=`realpath ./vms`
vboxmanage setproperty machinefolder $VBOX_USER_HOME
vboxmanage list vms

