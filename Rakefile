#!/usr/bin/env rake

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
  sh "grep mini.iso iso/SHA256SUMS | sed 's/\s\s*\..*.iso$//' | tee iso/mini.sha256"
end

namespace :iso do
  task :mini => ['iso/mini.iso', 'iso/mini.sha256']
end

config_files = FileList['config/*.json']
config_files.each do |config_file|
  base_name = config_file.pathmap("%n")
  ovf_file = config_file.pathmap("ovf/%n.ovf")

  ovf_dir = config_file.pathmap("build/%n")
  box_file = config_file.pathmap("boxes/%n.virtualbox.box")

  namespace :ovf do 
    directory ovf_dir

    file ovf_file => [ovf_dir, config_file] do
      sh "packer build #{config_file}"
    end

    desc "build #{ovf_file}"
    task base_name => config_file
  end

  namespace :box do 
    file box_file => ['boxes', ovf_file] do
      touch box_file
    end
    desc "build #{box_file}"
    task base_name => box_file do
    end
  end
end

file 'ovf/mini.ovf' => ['iso/mini.iso', 'iso/mini.sha256']

# vagrant box add --force --name rails_dev_box builds/rails_dev_box.virtualbox.box
# vagrant destroy
# vagrant up