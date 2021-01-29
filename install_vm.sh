#!/bin/bash

echo "updating system, installing agent(proxmox) and docker"

sudo apt update
sudo apt upgrade
sudo apt-get install  qemu-guest-agent
sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
sudo usermod -aG docker $USER
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
 sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
 docker info
 sudo apt update
 sudo usermod -aG docker $USER
 echo "Installing Docker Compose"
 sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 sudo chmod +x /usr/local/bin/docker-compose

 echo "Now log out and back in again"
