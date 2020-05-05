sudo mkdir /data/k8s
sudo useradd nfsnobody
sudo groupadd nfsnobody
sudo usermod -a -G nfsnobody nfsnobody
sudo chown nfsnobody:nfsnobody /srv/nfs/kubedata

**ubuntu

sudo apt-get install nfs-common nfs-kernel-server -y

Configuration : You can configure the directories to be exported by adding them to the /etc/exports file. For example:
sudo vi /etc/exports
/data/k8s 192.168.50.10(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)

To start the NFS server, you can run the following command at a terminal prompt:
sudo systemctl enable nfs-server
sudo systemctl stop nfs-kernel-server.service
sudo systemctl start nfs-kernel-server.service
sudo systemctl status nfs-server
sudo systemctl enable nfs-server

Run export commands

sudo exportfs -rav
sudo exportfs -v

Setup NFS client, mount and verify
sudo apt install nfs-common -y
sudo mount -t nfs 172.42.42.100:/data/k8s /mnt
mount | grep kubedata
