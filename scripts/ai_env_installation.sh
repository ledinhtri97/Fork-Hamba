#!/bin/bash

echo "Install Docker and Docker Compose"

sudo groupadd docker

sudo usermod -aG docker $USER

wget https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m)

sudo mv docker-compose-linux-$(uname -m) /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo "Docker and Docker Compose installed successfully"

echo "Install Nvidia Container Toolkit"

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

echo "Nvidia Container Toolkit installed successfully"
echo "You may need to log out and log back in for the changes to take effect."

#############################################################################################################