  if [ ! -d "/data" ]; then
	  mkdir /data
  fi
  if [ ! -d "/opt/devops/code" ]; then
	  mkdir -p /opt/devops/code
  fi

  echo "updating locale"
  echo 'LANG="en_US.UTF-8"' > /etc/locale.conf
  mkdir -p /auto/ecs/bin
  # rsync -avz /home/vagrant/devops /data/.
  chown vagrant:vagrant -R /opt/devops/code


  echo "exit 0" > /auto/ecs/bin/install-dotfiles
  chmod +x /auto/ecs/bin/install-dotfiles
  echo "installing ntpdate"

  yum update -y
  yum install -y ntpdate  tree rsync curl wget unzip vim rpm-build rsync net-tools nodejs python3
  systemctl status ntpd
  systemctl start ntpd
  systemctl enable ntpd
  yum install epel-release -y

  #ntpdate 0.centos.pool.ntp.org
  #sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
  #systemctl restart sshd;

  cat devops/id_rsa.pub >> .ssh/authorized_keys

  echo "Centos provisioning is  completed................................................"
