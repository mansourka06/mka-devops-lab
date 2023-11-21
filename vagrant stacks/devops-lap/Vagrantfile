# -*- mode: ruby -*-
# vi: set ft=ruby :
# To enable zsh, please set ENABLE_ZSH env var to "true" before launching vagrant up 
#   + On windows => $env:ENABLE_ZSH="true"
#   + On Linux  => export ENABLE_ZSH="true"

Vagrant.configure("2") do |config|
    config.vm.define "devops-lab" do |devops|
      devops.vm.box = "geerlingguy/centos7"
      devops.vm.network "private_network", type: "dhcp"
      devops.vm.hostname = "devops-lab"
      devops.vm.provider "virtualbox" do |v|
        v.name = "devops-lab"
        v.memory = 2048
        v.cpus = 2
      end
      devops.vm.provision :shell do |shell|
        shell.path = "install_tools.sh"
        shell.env = { 'ENABLE_ZSH' => ENV['ENABLE_ZSH'] }
      end
    end
  end  