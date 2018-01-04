# rails-dev-box
Custom Vagrant box using Packer and VirtualBox based on chef/bento/ubuntu

## Required Software 

* VirtualBox [virtualbox-5.1_5.1.30-118389_Ubuntu_xenial_amd64.deb](http://download.virtualbox.org/virtualbox/5.1.30/virtualbox-5.1_5.1.30-118389~Ubuntu~xenial_amd64.deb)
* Vagrant [vagrant_2.0.1_x86_64.deb](https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.deb)
* Packer [packer_1.1.3_linux_amd64.zip](https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip)

## Build process

```bash
$ ./build
```

## Repository Files

* build # Bash script to execute packer with configuration 
* rails_dev_box.json # json configuration file for packer
* http/preseed.cfg # ubuntu install configuration file
* scripts/ # bash scripts listed in json configuration file 

## Generated Files

* packer_cache/ # stuff packer downloads for build, like the ubuntu iso
* builds/ # output box files 

