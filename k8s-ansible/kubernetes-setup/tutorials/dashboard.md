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


Follow the sample user access creation for admin-user
https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
