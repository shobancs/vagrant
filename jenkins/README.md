### install Sonarqube community docker container on the sonarqube hosts
docker run -d --name sonarqube -p 9000:9000 sonarqube

## Install Artifactory pro version on the artifactory host

docker run --name artifactory -d -p 8081:8081 docker.bintray.io/jfrog/artifactory-pro:latest
