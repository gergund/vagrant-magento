#!/usr/bin/env bash

/bin/echo  "Configure yum repos ..."
	/usr/bin/sudo yum install -y https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && /bin/echo 'EPEL - done'
	if [[ $? != 0 ]]; then
		/usr/bin/curl --retry 3 -o /tmp/epel-release-6-8.noarch.rpm https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm 
		/usr/bin/sudo yum localinstall -y /tmp/epel-release-6-8.noarch.rpm
	fi
	/usr/bin/sudo yum clean all
/bin/echo  "Done"

/bin/echo "Install ansible ..."
	/usr/bin/sudo yum install -y ansible && /bin/echo 'Install of ansible - done'
/bin/echo "Done"

/bin/echo "Copy ansible inventory file and change permission ..."
/bin/cp /vagrant/ansible/inventory/vagrant_inf /tmp/vagrant_inf
/bin/chmod 600 /tmp/vagrant_inf

/usr/bin/sudo /usr/bin/ansible-playbook -i /tmp/vagrant_inf /vagrant/ansible/playbooks/site.yml
