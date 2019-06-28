#!/bin/bash


#echo "Enter a username"
#read user
#export user

#install

#make sure java is installed


sudo apt update
sudo apt install -y wget vim openjdk-8-jdk openjdk-8-jre

#create a jenkins user

sudo useradd --create-home jenkins
sudo usermod --shell /bin/bash jenkins

#install the lastest jenkins WAR file into the correct folder

sudo su - jenkins -c  "wget http://updates.jenkins-ci.org/latest/jenkins.war"

#install the jenkins systemd service script

sudo cp jenkins.service /etc/systemd/system/

#load in new service for systemd

sudo systemctl daemon-reload

#start the jenkins service

sudo systemctl start jenkins
sudo systemctl enable jenkins

