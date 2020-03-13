This repository contains examples and best practices for building Ansible Playbooks.

### Ansible Workshop Decks
https://github.com/ansible/workshops

## The Ansible Command
----------------
#### Ansible Ad-Hoc Command, ping command

`ansible all -m ping`

#### Ansible Modules

`ansible-doc --list`

#### Running an Ansible Playbook, install nginx in all the hosts
 ```
 cd playbooks\nginx
 ansible-playbook nginx.yml
 ```

### Deploy Wordpress-nginx stack with Ansible playbook, custom hosts file path

Prerequisite Manual install of PHP56
```
sudo yum install -y epel-release
wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo rpm -ivh remi-release-7.rpm
sudo yum update

sudo yum install php56 php56-php php56-php-mysqlnd php56-php-gd php56-php-mcrypt php56-php-mbstring php56-php-xml php56-php-cli
```

```
cd playbooks\hosts.example
ansible-playbook -i hosts.example site.yml
```
