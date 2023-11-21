# VAGRANT-DEVOPS-LAB

Linux Tool Installation Script

## Requirements

- Virtual Box
- Vagrant
- vagrant-vbguest plugin
```bash
vagrant plugin install vagrant-vbguest --plugin-version 0.21
```

## Installation

This script automates the installation of various tools on a Linux system. It supports installing:
- [x] ansible
- [x] docker
- [x] terraform 
- [x] vim
- [x] git
- [x] curl
- [x] jenkins.


## Usage

### Commands :

1. **Clone this repository** :
```bash
git clone https://github.com/mansourka06/vagrant-devops-lab.git
```

2. **Run the installation** : open a terminal and navigate to the directory where the script is located
```bash
vagrant up
```


> **NOTE:**
 - Replace the list of packages as needed.
 - The script assumes a CentOS or Red Hat-based distribution.
 - For Jenkins installation, make sure to review Jenkins' official documentation for any additional setup steps.



> **Available Options:**
 - ON : Enable tool installation
 - OFF : Disable tool installation
 

3. **To shutdown VM use command above** :
```bash
vagrant halt
```

## Author
Mansour KA
