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
    net-tools \
    software-properties-common -y && \

### Adcionando Chaves e Repositório Docker-CE ###   
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \    
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" && \
sudo apt-get update -y && \
### Instalação do Docker ####
sudo apt-get install docker docker-compose -y && \
sudo docker version && \

### Adcionando Chaves e Repositório K8S ###
sudo curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \

### Configurção De SO para K8S
sudo swapoff -a  && \
sudo modprobe br_netfilter ip_vs_rr ip_vs_wrr ip_vs_sh nf_conntrack_ipv4 ip_vs && \



### Instalação do K8S ####
sudo apt-get update -y && \
sudo apt-get install -y kubelet kubeadm kubectl -y && \
sudo kubeadm config images pull
sudo sed -i "s/cgroup-driver=systemd/cgroup-driver=cgroupfs/g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf && \
sudo cat << EOF > /etc/modules-load.d/k8s.conf
br_netfilter
ip_vs
ip_vs_rr
ip_vs_sh
ip_vs_wrr
nf_conntrack_ipv4
EOF 