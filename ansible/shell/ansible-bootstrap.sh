
  yum install epel-release -y
  yum install ansible -y

  mkdir /etc/ansible/group_vars
  echo "ansible_ssh_user: vagrant" >> servers

  echo "Ansible host provisioning is  completed................................................"
