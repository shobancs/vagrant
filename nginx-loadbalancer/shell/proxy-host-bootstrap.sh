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
  yum install -y ntpdate  tree rsync curl wget unzip vim rpm-build rsync net-tools nodejs
  yum install epel-release -y
  yum install nginx -y
  /bin/cp -rf /home/vagrant/devops/nginx-conf/nginx.conf /etc/nginx
  /bin/cp -rf /home/vagrant/devops/nginx-conf/conf.d/nodejs-basic.conf /etc/nginx/conf.d

  systemctl restart nginx
  systemctl enable nginx

  curl -Is http://172.16.33.50

  #Disable SElinux hence copy the selinux configs
  /bin/cp -rf /home/vagrant/devops/selinux/config /etc/selinux/


  echo "Centos provisioning is  completed................................................"
