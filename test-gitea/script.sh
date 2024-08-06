#!/bin/bash
sudo apt-get update
sudo apt install net-tools
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt install docker-ce docker-ce-cli containerd.io uidmap -y
sudo systemctl status docker
sudo apt install docker-compose
sudo groupadd -g 1100 gitea
sudo useradd -u 1100 -g 1100 gituser
sudo mkdir /home/gitea
sudo chown gituser:gitea /home/gitea
echo 'version: "3"

networks:
 gitea:
  external: false

services:
 server:
  image: gitea/gitea:latest
  container_name: gitea
  environment:
   - USER_UID=1100
   - USER_GID=1100
  restart: always
  networks:
   - gitea
  volumes:
   - ./gitea:/data
   - /etc/timezone:/etc/timezone:ro
   - /etc/localtime:/etc/localtime:ro
  ports:
   - "3000:3000"
   - "222:22"' > /home/docker-compose.yml
cd /home
sudo docker compose up