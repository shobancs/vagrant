
  yum install epel-release
  yum install ansible

  mkdir /etc/ansible/group_vars
  echo "ansible_ssh_user: vagrant" >> servers

  echo "Ansible host provisioning is  completed................................................"
