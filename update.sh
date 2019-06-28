#!/bin/bash



#update


#stop the jenkins service

sudo systemctl stop jenkins

#Install latest jenkins war into correct file
cd ../../jenkins/
sudo rm jenkins.war*
sudo su - jenkins -c "wget http://updates.jenkins-ci.org/latest/jenkins.war"


#start the jenkins service

sudo systemctl start jenkins
sudo systemctl enable jenkins


