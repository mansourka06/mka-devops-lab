#!/bin/bash

# Update system packages
sudo apt update

# Install required dependencies
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# Install Docker if not already installed
if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
fi

# Install Docker Compose if not already installed
if ! command -v docker-compose &> /dev/null; then
    sudo apt install -y docker-compose
fi

# Clone AWX repository
git clone https://github.com/ansible/awx.git
cd awx/installer

# Run the AWX installer
ansible-playbook -i inventory install.yml

# Access AWX at http://localhost:80

