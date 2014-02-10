# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos-6.5_x86_64"

  config.vm.box_url = "http://my.itwnik.com/vagrant/centos-6.5_x86_64.box"
  config.vm.synced_folder '.', '/vagrant'

  config.vm.define :app do |app|
	app.vm.provider :virtualbox do |vb|
		vb.customize ['modifyvm', :id, '--memory', 1024]
	end
  	app.vm.network :forwarded_port, guest: 80, host: 8888
   	app.vm.network :forwarded_port, guest: 443, host: 8443

  	app.vm.network "private_network", ip: "192.168.56.110"
	app.vm.provision :shell, :inline => '/vagrant/utils/bootstrap.sh'
	app.vm.provision :shell, :inline => '/usr/bin/sudo /usr/bin/ansible-playbook --limit=app -i /tmp/vagrant_inf /vagrant/ansible/playbooks/site.yml'

  end

  config.vm.define :db do |db|
	db.vm.provider :virtualbox do |vb|
		vb.customize ['modifyvm', :id, '--memory', 1024]
	end
   	db.vm.network :forwarded_port, guest: 3306, host: 8306

  	db.vm.network "private_network", ip: "192.168.56.111"
	db.vm.provision :shell, :inline => '/vagrant/utils/bootstrap.sh'
	db.vm.provision :shell, :inline => '/usr/bin/sudo /usr/bin/ansible-playbook --limit=db -i /tmp/vagrant_inf /vagrant/ansible/playbooks/site.yml'

  end

  #config.vm.define :cache do |cache|
  #	cache.vm.provider :virtualbox do |vb|
  #		vb.customize ['modifyvm', :id, '--memory', 512]
  #	end
  #	cache.vm.network :forwarded_port, guest: 80, host: 8888
  # 	cache.vm.network :forwarded_port, guest: 443, host: 8443

  # 	cache.vm.network "private_network", ip: "192.168.56.111"
  #	cache.vm.provision :shell, :inline => '/vagrant/utils/bootstrap.sh'
  #	cache.vm.provision :shell, :inline => '/usr/bin/sudo /usr/bin/ansible-playbook --limit=cache -i /tmp/vagrant_inf /vagrant/ansible/playbooks/site.yml'

  #end
  
  
end
