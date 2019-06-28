#!/bin/bash


#script to create vms on Azure

#login to azure

az login

#create resource group

az group create --name VM_startup --location uksouth

#set default location, #set resource group default

az configure --defaults location=uksouth
az configure --defaults group=VM_startup

#create a virtual network and subnet

az network vnet create --name MyVirtualNetwork --address-prefixes 10.0.0.0/16 \
--subnet-name MySubnet --subnet-prefix 10.0.0.0/24

az network public-ip create --name PIPOne --dns-name myuniquednsname444456
az network public-ip create --name PIPTwo --dns-name myuniquednsname444457

az network nsg create --name MyNetworkSecurityGroup

az network nsg rule create --name SSH --priority 400 \
--nsg-name MyNetworkSecurityGroup --destination-port-ranges 22

az network nsg rule create --name Jenkins --priority 401 \
--nsg-name MyNetworkSecurityGroup --destination-port-ranges 80

az network nsg rule create --name HTTPS --priority 402 \
--nsg-name MyNetworkSecurityGroup --destination-port-ranges 443



#create a network interface so that VMS can communicate over internet

az network nic create --name NICOne --vnet-name MyVirtualNetwork \
--subnet MySubnet --public-ip-address PIPOne -nsg MyNetworkSecurityGroup

az network nic create --name NICTwo --vnet-name MyVirtualNetwork \
--subnet MySubnet --public-ip-address PIPTwo -nsg MyNetworkSecurityGroup

#create vms

az vm create --name VMOne --image Canonical:UbuntuServer:18.04-LTS:latest \
--size Standard_B1ms --nics NICOne --generate-ssh-keys \
--admin-username admin123 --admin-password passsword123! 

az vm create --name VMTWo --image Canonical:UbuntuServer:18.04-LTS:latest \
--size Standard_B1ms --nics NICTwo --generate-ssh-keys \
--admin-username admin123 --admin-password password123!



