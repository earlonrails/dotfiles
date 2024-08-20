#!/bin/bash

codename=$(lsb_release -cs)
brew bundle install --file=./Brewfile.linux
sudo apt update && sudo apt install -y gimp \
        meld \
        steam \
        vlc \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
        wget \
        openshot-qt \
        transmission-gtk

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
        "deb https://download.docker.com/linux/ubuntu ${codename} stable"
sudo apt update
sudo apt install -y docker-ce docker-compose
sudo gpasswd -a "${USER}" docker

# vscode
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - 
sudo add-apt-repository \
        "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# chrome
curl -O https://packages.cloud.google.com/apt/doc/apt-key.gpg && sudo apt-key add apt-key.gpg
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' 
sudo apt update
sudo apt install -y google-chrome

# obs
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install -y obs-studio

# rancher-desktop
curl -s https://download.opensuse.org/repositories/isv:/Rancher:/dev/deb/Release.key | gpg --dearmor | sudo dd status=none of=/usr/share/keyrings/isv-rancher-dev-archive-keyring.gpg
sudo apt update
sudo apt install -y rancher-desktop
