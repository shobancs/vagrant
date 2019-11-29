
  echo "checkmk_ssh_user: vagrant" >> servers


  /bin/cp -rf /home/vagrant/devops/selinux/config /etc/selinux/

  yum install https://mathias-kettner.de/support/1.5.0p12/check-mk-raw-1.5.0p12-el7-38.x86_64.rpm -y

  omd version
  omd create fosslinuxmonitor
  omd start fosslinuxmonitor

  curl -iL http://172.16.20.60/fosslinuxmonitor

  echo "Checkmk master host provisioning is  completed................................................"
