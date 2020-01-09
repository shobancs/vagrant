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
  yum install -y ntpdate  tree rsync curl wget unzip vim rpm-build rsync net-tools nodejs python2 python3 maven

  #ntpdate 0.centos.pool.ntp.org

  # Install ELK prequisites 1) Java 2) Nginx
 yum install java-11-openjdk -y
 yum install epel-release -y
 yum install nginx -y
 systemctl start nginx
 systemctl enable nginx


  echo "Centos provisioning is  completed................................................"
