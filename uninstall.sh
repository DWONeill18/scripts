#!/bin/bash

#Stop the jenkins service
sudo systemctl stop jenkins

#remove service


#remove the jenkins user
sudo userdel -r jenkins

#delete the jenkins user home folder

sudo rm -r /home/jenkins/



