
1) K8s install methods and tools
Install Minikube : https://kubernetes.io/docs/setup/learning-environment/minikube/#minikube-features



###Learn K8s components
https://kubernetes.io/docs/concepts/overview/components/

### Understanding Kubernetes Objects
https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/
kubectl apply -f https://k8s.io/examples/application/deployment.yaml --record

###Playing with kubeadm in Vagrant Machines, Part 2
https://medium.com/@joatmon08/playing-with-kubeadm-in-vagrant-machines-part-2-bac431095706

### Deploy Web UI (Dashboard)
https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/#deploying-the-dashboard-ui

Deploying dashboard will cause an issue when Calcico or Flannel running in the cluster when dashboard runs on the cluster node. to avoid this issue we have to update node selector to control plane node as of 04/04/2020
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc7/aio/deploy/recommended.yaml
update deployment config with "nodeName: k8s-master" under Deployment spec, then apply
kubectl edit deployment.v1.apps/kubernetes-dashboard -n kubernetes-dashboard
kubectl edit deployment.v1.apps/dashboard-metrics-scraper -n kubernetes-dashboard

Ensure the dashboard is runing on master
dashboard-metrics-scraper-67995dccd7-p7zk4   1/1     Running   0          2m10s   192.168.235.197   k8s-master   <none>           <none>
kubernetes-dashboard-65b4c668f5-l2fxx        1/1     Running   0          8m34s   192.168.235.196   k8s-master   <none>           <none>


kubectl proxy
Kubectl will make Dashboard available at http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.


Install Kube-apiserver on master node
https://snapcraft.io/install/kube-apiserver/ubuntu
vagrant ssh k8-master
sudo apt update
sudo apt install snapd
sudo snap install kube-apiserver

kube-apiserver --enable-admission-plugins=DefaultStorageClass

Storage class creation
kubectl create -f lab-example/storage/StorageClass.yaml
kubectl get storageclass

Volumes examples

https://github.com/kubernetes/examples/tree/master/staging/volumes/nfs
