#!/bin/bash
H=$(pwd)
echo "Installing Harbor V2.1.3"

echo "Downloading archive file...."

wget https://github.com/goharbor/harbor/releases/download/v2.1.3/harbor-offline-installer-v2.1.3.tgz

echo "Setting domain for Harbor=myharbor.dom"

tar xvf harbor-offline-installer-v2.1.3.tgz

cd harbor

cp harbor.yml.tmpl harbor.yml

sed -i 's/hostname: reg.mydomain.com/hostname: myharbor.dom/g' ${H}/harbor/harbor.yml 

echo "remove https"
sed -i 's/port: 443/# port: 443/g' ${H}/harbor/harbor.yml
sed -i 's/certificate:/# certificate:/g' ${H}/harbor/harbor.yml
sed -i 's/private_key:/# private_key:/g' ${H}/harbor/harbor.yml
sed -i 's/data_volume: /data_volume: \/home\/nathans\/harbor\/data/g' ${H}/harbor/harbor.yml

echo "Put the domain myharbor.dom in the /etc/hosts file for DNS"
echo "Initiate installer"

echo "Update Docker daemon file LINUX ONLY!!"

sudo echo "{ " >>/etc/docker/daemon.json
echo "\"insecure-registries\" : [\"myharbor.dom\", \"0.0.0.0\"]" >>/etc/docker/daemon.json
echo "}" >> /etc/docker/daemon.json
sudo ./install.sh --with-clair
