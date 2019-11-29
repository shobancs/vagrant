
  echo "checkmk_ssh_user: vagrant" >> servers
  wget http://172.16.20.60/fosslinuxmonitor/check_mk/agents/check-mk-agent-1.5.0p12-1.noarch.rpm
  rpm -ivh check-mk-agent-1.5.0p12-1.noarch.rpm
  echo " host provisioning is  completed................................................"
