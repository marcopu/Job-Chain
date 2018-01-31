#!/bin/bash

sudo -i

#Update iniziale
apt-get update

#Installazione Java8
echo "Installazione Java8"
  echo debconf shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  debconf-set-selections
  add-apt-repository ppa:webupd8team/java
  apt-get update
  apt-get -y install oracle-java8-installer
  
#Installazione Maven
echo "Installazione Maven"
  apt-get update
  apt-get -y install maven

#Installazione Ansible
echo "Installazione Ansible"
  apt-get update
  apt-get -y install software-properties-common
  apt-add-repository -y ppa:ansible/ansible
  apt-get update
  apt-get -y install ansible
    
#Set timezone
echo "Set timezone"
timedatectl set-timezone Europe/Rome

#Settaggio permessi root SSH
echo "Setting SSH permissions"
sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
