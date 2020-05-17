#!/usr/bin/env bash
###Jean Souza####
###16/05/2020####
#### Instalação do Kubernets #####

### Atualizaçã do OS e instalação do Docker no Ubundo####
sudo apt-get update -y && \
sudo apt-get upgrade -y && \
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y && \
### Adcionando Chaves e Repositório ###   
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \    
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y && \
### Instalação do Docker ####
sudo apt-get install docker docker-compose -y &&\
sudo docker version
