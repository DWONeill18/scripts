#!/bin/bash


sudo apt install -y jq
sudo apt install -y wget vim openjdk-8-jdk openjdk-8-jre
sudo apt-get install maven
mvn -version
sudo apt install curl


sudo groupadd -r wildfly
sudo useradd -r -g wildfly -d /opt/wildfly/ -s /sbin/nologin wildfly

WILDFLY_VERSION=16.0.0.Final
wget https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz -P /tmp

sudo tar xf /tmp/wildfly-$WILDFLY_VERSION.tar.gz -C /opt/
sudo ln -s /opt/wildfly-$WILDFLY_VERSION /opt/wildfly

sudo chown -RH wildfly: /opt/wildfly

sudo mkidr -p /etc/wildfly
sudo cp /opt/wildfly/docs/contrb/scripts/systemd/wildfly.conf /etc/wildfly/

sudo cp /opt/wildfly/docs/contrib/scripts/systemd/launch.sh /opt/wildfly/bin/

sudo sh -c 'chmod +x /opt/wildfly/bin/*.sh'

sudo cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start wildfly
sudo systemctl status wildfly
sudo systemctl enable wildfly


sudo ufw allow 8080/tcp

#install azure
curl -L https://aka.ms/InstallAzureCli | bash
az login
#install azure


vm2_ip = $(az network public-ip show --name publicip2 | jq -r '.ipAddress')
echo $vm2_ip


