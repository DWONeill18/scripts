#!/bin/bash


#ssh -q -L 8082:localhost:8082
#jq install
sudo apt install -y jq

#maybe install java on here?

#git clone https://github.com/DWONeill18/devOps_jenkinsSetup.git
#cd devOps_jenkinsSetup
#./install.sh
#./update.sh
sudo apt install wget
sudo apt install -y wget vim openjdk-8-jdk openjdk-8-jre
sudo apt-get install maven
mvn -version
sudo apt install curl

curl https://download.jboss.org/wildfly/10.1.0.Final/wildfly-10.1.0.Final.tar.gz -o wildfly.tar.gz
tar -xvf wildfly.tar.gz



#install azure
curl -L https://aka.ms/InstallAzureCli | bash
az login
#install azure


vm2_ip = $(az network public-ip show --name publicip2 | jq -r '.ipAddress')
echo $vm2_ip

#az vm show -name -q -L 8082:localhost:8082




#Need to sort out keys first

#scp user@ip:/home/jenkins/jenkins.war /home/user2/wildfly-10.1.0.Final/standalone/deployments/

curl https://repo1.maven.org/maven2/com/h2database/h2/1.4.197/h2-1.4.197.jar -o h2-1.4.197.jar

#java -jar h2-1.4.197.jar -webAllowOthers &

#./standalone.sh -b=0.0.0.0
