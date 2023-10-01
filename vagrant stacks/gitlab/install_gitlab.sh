#!/bin/bash

############################
# Author:Mansour KA
# Last update : 01/10/2023
############################

## NB: 
# Please keep in mind that GitLab installation may change over time, 
# so be sure to check the official GitLab installation documentation for the latest instructions.

IP=$(hostname -I | awk '{print $2}')

# Update the package list and install necessary dependencies
sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y curl openssh-server ca-certificates postfix vim git wget curl >/dev/null

# Download and install GitLab package
echo "START - install gitlab - "$IP

echo "[1]: install gitlab"

curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get update -qq >/dev/null
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo apt install -y gitlab-ce
sudo gitlab-ctl reconfigure

echo "END - install gitlab"

# Configure and start GitLab
sed -i s/"gitlab.example.com"/"${1}"/g /etc/gitlab/gitlab.rb
sudo gitlab-ctl reconfigure

# Display the initial root password and URL
echo "GitLab has been installed."
echo "The initial root password is located in /etc/gitlab/initial_root_password."
echo "You can access GitLab at http://localhost or using your server's IP address."

##
echo "For this Stack, you will use $IP IP Address"
