

###Learn K8s components
https://kubernetes.io/docs/concepts/overview/components/

### Understanding Kubernetes Objects
https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/
kubectl apply -f https://k8s.io/examples/application/deployment.yaml --record


###Playing with kubeadm in Vagrant Machines, Part 2
https://medium.com/@joatmon08/playing-with-kubeadm-in-vagrant-machines-part-2-bac431095706


### Deploy Web UI (Dashboard)
https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/#deploying-the-dashboard-ui

T$GAVb@:2V>$`k~F

XF$ex7^8A(bLR@3S
Stupiltet1230

### commands
verbose pods information
kubectl get pods -o wide

kubectl get node --show-label
kubectl delete pod nginx
 1228  kubectl get nodes --show-labels
 1229  kubectl label node kslave2 season=spring
 1230  kubectl get nodes --show-labels
 1231  cat nodeselect.yml
 1232  cat nodeselector.yml
 1233  cat nodeselect.yml
 1234  vi nodeselect.yml
 1235  kubectl create -f nodeselect.yml
 1236  kubectl get pods -o wide
 1237  kubectl label node kslave1 season=spring
 1238  kubectl get nodes --show-labels
 1239  cat nodeselect.yml
