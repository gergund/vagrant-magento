# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos-6.5_x86_64"

  config.vm.box_url = "http://my.itwnik.com/vagrant/centos-6.5_x86_64.box"
  config.vm.synced_folder '.', '/vagrant'

  #config.vm.define :server do |server|
  #	server.vm.network :forwarded_port, guest: 22, host: 2222
  #end
  config.vm.provision :shell, :inline => '/vagrant/utils/bootstrap.sh'
  
end
