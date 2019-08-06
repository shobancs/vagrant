#Prerequisites

#Vagrant
#Create Single master and multi node K8s cluster, it installs docker exclusively
vagrant up --provision

# install rke
https://rancher.com/docs/rke/latest/en/installation/
MacOS: rke_darwin-amd64
Linux (Intel/AMD): rke_linux-amd64
Linux (ARM 32-bit): rke_linux-arm
Linux (ARM 64-bit): rke_linux-arm64
Windows (32-bit): rke_windows-386.exe
Windows (64-bit): rke_windows-amd64.exe

#Configure rke
rke config --name cluster.yml

# Start k8s cluster
rke up

# set kubeconfig to environment variable
export KUBECONFIG=/Users/scheekur/Desktop/shoban/Training/DevOps/k8s/kubernetes-setup/k8s-cluster.yml
