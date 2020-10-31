kubectl create ns jenkins
kubectl create -f lab-example/pods/jenkins/jenkins-deployment.yaml --namespace=jenkins
kubectl  describe deployments --namespace=jenkins
kubectl get pods -n jenkins
kubectl create -f lab-example/pods/jenkins/jenkins-service.yaml --namespace=jenkins
