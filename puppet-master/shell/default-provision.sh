
	# create devops directory
	mkdir -p /opt/devops/

	echo "updating locale"
	echo 'LANG="en_US.UTF-8"' > /etc/locale.conf
	cat /home/vagrant/devops/id_rsa.pub >>  /home/vagrant/.ssh/authorized_keys
	export LANG=en_US.UTF-8


	yum update -y
  yum install -y ntpdate  tree rsync curl wget unzip vim rpm-build rsync net-tools nodejs python2 python3 maven

	yum -y install ntp ntpdate
	#ntpdate 0.centos.pool.ntp.org
	#systemctl start ntpd
  #systemctl enable ntpd
