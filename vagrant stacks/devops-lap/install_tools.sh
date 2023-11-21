#!/bin/bash

#####################################################################################################################
set -e 

# ENABLE/DESABLE INSTALL TOOLS
GIT=ON  # supported value [ON, OFF]
CURL=ON # supported value [ON, OFF]
ANSIBLE=OFF  # supported value [ON, OFF]
DOCKER=OFF   # supported value [ON, OFF]
JENKINS=OFF # supported value [ON, OFF]
TERRAFORM=OFF   # supported value [ON, OFF]
VIM=OFF # supported value [ON, OFF]

# Update package list
sudo yum update -y

# install git
case $GIT in
    ON)
      yum install -y git
      ;;
    OFF)
      echo "skip git installation"
      ;;
    *)
     echo "Only ON or OFF value is supported"
     ;;
esac

# install vim
case $VIM in
    ON)
      yum install -y vim
      ;;
    OFF)
      echo "skip vim installation"
      ;;
    *)
     echo "Only ON or OFF value is supported"
     ;;
esac

# install curl
case $CURL in
    ON)
      yum install -y curl
      ;;
    OFF)
      echo "skip curl installation"
      ;;
    *)
     echo "Only ON or OFF value is supported"
     ;;
esac

case $ANSIBLE in
    ON) # Install Ansible 
      # install dependance package
      yum -y install epel-release python3
      # install ansible
      curl -sS https://bootstrap.pypa.io/pip/3.6/get-pip.py | sudo python3
      /usr/local/bin/pip3 install ansible
      yum install -y sshpass
      echo "Ansible installation completed."
      ansible --version
      ;;
    OFF)
      echo "skip ansible installation"
      ;;
    *)
     echo "Only ON or OFF value is supported"
     ;;
esac

case $DOCKER in
    ON) # Install Docker and docker Compose
        # install docker
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh
        sudo usermod -aG docker vagrant
        sudo systemctl enable docker
        sudo systemctl start docker
        #install docker compose
        sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        echo "Docker installation completed."
        ;;
    OFF)
      echo "skip docker installation"
      ;;
    *)
     echo "Only ON or OFF value is supported"
     ;;
esac

case $TERRAFORM in
    ON) # Install Terraform
      TERRAFORM_VERSION="0.14.7" # Change this to the desired Terraform version
      wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
      unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
      sudo mv terraform /usr/local/bin/
      rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
      ;;
    OFF)
      echo "skip Terraform installation"
      ;;
    *)
     echo "Only ON or OFF value is supported"
     ;;
esac

case $JENKINS in
    ON) # Install Jenkins
      sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
      sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
      sudo yum install -y jenkins
      sudo systemctl start jenkins
      sudo systemctl enable jenkins
      ;;
    OFF)
      echo "skip jenkins installation"
      ;;
    *)
     echo "Only ON or OFF value is supported"
     ;;
esac

## Install zsh if needed
# To enable zsh: 
export ENABLE_ZSH="true" # comment this line if you don't want to install zsh

if [[ !(-z "$ENABLE_ZSH")  &&  ($ENABLE_ZSH == "true") ]]
then
    echo "We are going to install zsh"
    sudo yum -y install zsh git
    echo "vagrant" | chsh -s /bin/zsh vagrant
    su - vagrant  -c  'echo "Y" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
    su - vagrant  -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
    sed -i 's/^plugins=/#&/' /home/vagrant/.zshrc
    echo "plugins=(git  docker docker-compose colored-man-pages aliases copyfile  copypath dotenv zsh-syntax-highlighting jsontools)" >> /home/vagrant/.zshrc
    sed -i "s/^ZSH_THEME=.*/ZSH_THEME='agnoster'/g"  /home/vagrant/.zshrc
  else
    echo "The zsh is not installed on this server"    
fi

##
echo "For this Stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"
#####################################################################################################################