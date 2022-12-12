#!/bin/bash
sudo yum -y update && sudo yum install -y docker
sudo usermod -aG docker ec2-user
sudo systemctl start docker
docker run -p 8080:80 nginx
