
#setup Puppet master and Foreman servers

sudo yum -y install ntp ntpdate

sudo systemctl start ntpd
sudo systemctl enable ntpd
#
#Disable SElinux
sudo vi /etc/sysconfig/selinux
SELINUX=disabled

#edit the DNS configuration
sudo vi /etc/hosts
127.0.0.1  foreman.cheekuru.com foreman localhost
#127.0.1.1 foreman.cheekuru.com foreman
172.16.40.11 foreman.cheekuru.com puppet
172.16.40.12 node-1.cheekuru.com node-1

#Ping server host from agent and vice-versa

#Latest version of puppet lab setup
sudo yum -y install https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
sudo yum -y install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install https://yum.theforeman.org/releases/1.23/el7/x86_64/foreman-release.rpm
sudo yum update -y
sudo yum -y install foreman-installer
#edit /etc/host with wrong dns entries

sudo foreman-installer
sudo su -
puppet agent -t
puppet module install puppetlabs/stdlib

#foreman password reset

foreman-rake permissions:reset


#Install puppet agents on the nodes

sudo yum -y install https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
sudo yum -y install http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum update -y

sudo yum install -y puppet-agent
#copy puppet agent configuration from the master
vi /etc/puppetlabs/puppet/puppet.conf
# Clean puppet agent certs
rm -rf /etc/puppetlabs/puppet/ssl/

systemctl start puppet
systemctl enable puppet


puppet agent -t


#Launch Foreman in Chrome browser, if the local foreman site is not loaded, please following the instructions
Chrome/Catalina Certificate Issue
Posted on October 25, 2019
If you are having issues trying to reach a self signed website, router or esxi host, with an error:  NET::ERR_CERT_REVOKED . You will notice you cannot ignore and proceed in the new Mac OSX Catalina release!


A quick solution (ensure you trust the site)

In the chrome browser whilst on the page, type “thisisunsafe”
