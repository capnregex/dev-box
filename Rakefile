#!/usr/bin/env rake

vms_path = File.expand_path('./vms')

ENV['VBOX_USER_HOME']=vms_path

desc "virtual box directory"
directory 'vms'
file 'vms' do
  sh "vboxmanage setproperty machinefolder #{vms_path}"
end
file 'vms/VirtualBox.xml' => 'vms'
namespace :vms do
  task list: ['vms','vms/VirtualBox.xml'] do
    sh "vboxmanage list vms"
  end
  FileList['vms/*/*.vbox'].each do |vbox_file|
    if vbox_file =~ %r{vms/(.+)/\1.vbox}
      box_name = $1
      task box_name => [vbox_file,'vms'] do
        sh "VBoxManage", "startvm", box_name
      end
    end
  end
end

task default: :build

directory 'boxes'
directory 'iso'


file 'iso/mini.iso' => 'iso' do
  sh 'wget -O iso/mini.iso http://archive.ubuntu.com/ubuntu/dists/artful/main/installer-amd64/current/images/netboot/mini.iso'
end

file 'iso/SHA256SUMS' => 'iso' do
  sh 'wget -O iso/SHA256SUMS http://archive.ubuntu.com/ubuntu/dists/artful/main/installer-amd64/current/images/SHA256SUMS'
end

file 'iso/mini.sha256' => ['iso', 'iso/SHA256SUMS'] do
  sh "grep mini.iso iso/SHA256SUMS | sed 's/netboot\\///' | tee iso/mini.sha256"
end

namespace :iso do
  task :mini => ['iso/mini.iso', 'iso/mini.sha256']
end

config_files = FileList['config/*.json']
base_names = config_files.pathmap("build:%n")
box_files = config_file.pathmap("boxes/%n.virtualbox.box")
desc "build all"
task build: base_names
config_files.each do |config_file|
  base_name = config_file.pathmap("%n")
  ovf_file = config_file.pathmap("build/%n/packer-%n.ovf")
  build_dir = config_file.pathmap("build/%n")
  box_file = config_file.pathmap("boxes/%n.virtualbox.box")

  directory build_dir

  namespace :build do 
    task base_name => [config_file,'vms'] do
      sh "packer build -force -var 'name=#{base_name}' #{config_file}"
    end
  end

  namespace :ovf do 

    file ovf_file => [build_dir, config_file] do
      sh "packer build -force -var 'name=#{base_name}' #{config_file}"
    end

    desc "build #{ovf_file}"
    task base_name => [ovf_file]
  end

  namespace :box do 
    file box_file => ['boxes', ovf_file]

    desc "build #{box_file}"
    task base_name => box_file do
    end
  end

  namespace :package do
    desc "package #{box_file}"
    task base_name => box_file do
    # https://github.com/crohr/ebarnouflant/issues/7
    # VBoxManage import ./UCS-Virtualbox-Demo-Image.ova --vsys 0 --eula accept
    # VBoxManage list vms
    # vagrant package --base acef4c0a-35be-4640-a214-be135417f04d --output UCS.box
    # vagrant box add UCS.box --name UCS
    end
  end

  namespace :clear do
    task base_name do
      sh "VBoxManage closemedium disk packer-#{base_name} --delete" 
      sh "VBoxManage unregistervm packer-#{base_name} --delete"
    end
  end
end


file 'build/mini/packer-mini.ovf' => ['iso/mini.iso', 'iso/mini.sha256']

task :clean do
  %w(builds boxes build ovf vms).each do |dir|
    rm_rf dir
  end
end

# vagrant box add --force --name rails_dev_box builds/rails_dev_box.virtualbox.box
# vagrant destroy
# vagrant up
