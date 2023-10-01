# !/bin/bash

#install bash completion package
sudo apt-get install bash-completion

#add it to bashrc
echo "source <(kubectl completion bash)" >> ~/.bashrc

#validate source
source ~/.bashrc

