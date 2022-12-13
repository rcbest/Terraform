#!/bin/bash
sudo yum -y update 
sudo yum -y install docker
echo "Docker installed!!"
sudo chown ec2-user:docker /var/run/docker.sock
sudo usermod -aG docker ec2-user
sudo systemctl start docker
docker run -p 8080:80 nginx
