#!/usr/bin/bash

# Install Git
if command -v yum >/dev/null 2>&1; then
    # Assuming it's a Red Hat-based system
    sudo yum -y install git
elif command -v apt-get >/dev/null 2>&1; then
    # Assuming it's a Debian-based system
    sudo apt-get -y install git
else
    echo "Unsupported package manager. Exiting."
    exit 1
fi

# Unarchive Tower install package
cd tower/
tar -xzvf awx.tar.gz -C ~/

# Copy docker-compose.yml
cp docker-compose.yml ~/.awx/awxcompose/

# Start AWX using Docker Compose
cd ~/.awx/awxcompose/
docker-compose up -d
