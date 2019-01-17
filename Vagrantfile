# -*- mode: ruby -*-
# vi: set ft=ruby :

$updateLocale=<<-UPDLOCALE
 echo "updating locale"
  echo 'LANG="en_US.UTF-8"' > /etc/locale.conf
UPDLOCALE

domain = 'scheekur.devops'
box = 'centos/7'
ram = 1024
vagrantcloud_box_url = 'https://vagrantcloud.com/puppetlabs/boxes/centos-7.2-64-puppet/versions/1.0.1/providers/virtualbox.box'
vagrant_box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.7.2/vagrant-centos-7.2.box"



puppet_nodes = [
    
    {:hostname => 'centos-dev',  :ip => '191.16.32.21', :box => box,  :ram => 2048, :master=>false},


]


Vagrant.configure("2") do |config|

  puppet_nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
	  node_config.disksize.size = '50GB'
      #node_config.vm.box_url = 'https://atlas.hashicorp.com/' + node_config.vm.box
      node_config.vm.hostname = node[:hostname] + '.' + domain
      node_config.vm.network :private_network, ip: node[:ip]
	 

      memory = node[:ram] ? node[:ram] : 512;
      node_config.vm.provider :virtualbox do |vb|
        vb.memory = memory
		
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        vb.customize ["modifyvm", :id, "--groups", "/scheekur-devops"]
        vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
		
      end



      #node_config.vm.provision :puppet do |puppet|
      node_config.vm.provision "file", source: "config", destination: "devops"
      node_config.vm.provision "shell", path: "shell/default-provision.sh"
      if node[:master]
        print "Puppet server machine is spininig \n"
        node_config.vm.provision "shell", inline: "/bin/systemctl stop firewalld && /bin/systemctl disable firewalld"
        node_config.vm.provision "shell", path: "shell/puppet-provision.sh"
        #puppet.manifests_path = 'provision/manifests'
        #puppet.module_path = 'provision/modules'

      else
        print "Started building a client machine   \n"
        node_config.vm.provision "shell", path: "shell/node-provision.sh"
      end

  
     # end
    end
  end
end
