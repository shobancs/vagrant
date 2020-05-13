### install Sonarqube community version on the sonarqube hosts using docker
docker run -d --name sonarqube -p 9000:9000 sonarqube

URL http://172.16.32.30:9000/admin/settings

### Integrate Sonarqube with Jenkins
https://medium.com/@amitvermaa93/jenkins-sonarqube-integration-129f5c49c4ca

## Install Artifactory pro version on the artifactory host
1) Register for trail license : https://jfrog.com/artifactory/free-trial/ Please note that, dont checked Artifactory Enterprise option for instance trail license

2) docker run --name artifactory -v $JFROG_HOME/artifactory/var/:/var -d -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-pro:latest

3) http://172.16.32.31:8081/artifactory/

### Integrate Artifactory with Jenkins

Security information event management
