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

  apt update -y
  apt install -y ntpdate  tree rsync curl wget unzip vim rsync net-tools nodejs python2 python3 maven
  apt install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
  sudo apt update -y
  apt-cache policy docker-ce
  apt install docker-ce -y
  #ntpdate 0.centos.pool.ntp.org

  systemctl start docker
  systemctl status docker
  systemctl enable docker
  usermod -aG docker vagrant
  docker info
  docker run hello-world

  echo "Gitlab host provisioning is  completed................................................"
