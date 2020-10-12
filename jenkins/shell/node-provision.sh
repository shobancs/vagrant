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

  apt-get update -y

  #ntpdate 0.centos.pool.ntp.org
  #to install Node.js 10.x and npm
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  apt-get install -y nodejs
  apt install openjdk-11-jdk -y
  ## You may also need development tools to build native addons:
  apt-get install gcc g++ make -y

  ## To install the Yarn package manager, run:
 curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

 echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
 apt-get update && sudo apt-get install yarn -y

 apt-get install -y ntpdate  tree rsync curl wget unzip vim rsync net-tools  python3 maven

 apt-get update && apt-get install yarn -y

 apt-get install gradle

  curl -fsSL https://get.docker.com/ | sh


  systemctl start docker
  systemctl status docker
  systemctl enable docker
  usermod -aG docker vagrant
  docker info
  docker run hello-world

  echo "Centos provisioning is  completed................................................"
