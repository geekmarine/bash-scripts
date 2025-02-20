#!/bin/bash

# Update package lists
sudo apt update

# Check for existing NVIDIA drivers (informative)
nvidia-smi &> /dev/null && echo "Existing NVIDIA drivers found (output will be suppressed)."

# Purge existing NVIDIA drivers and CUDA packages
sudo apt purge --auto-remove nvidia-* cuda-*

# Remove CUDA toolkit configuration files
sudo rm -rf /usr/local/cuda*

# Install the NVIDIA driver package repository (refer to official documentation for the latest PPA)
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
echo "**Please refer to the official NVIDIA documentation for the latest PPA URL:**"
echo "https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html"
echo "**Update the following command with the appropriate PPA URL:**"
# Example (replace with the actual PPA URL):
 sudo add-apt-repository ppa:graphics-drivers/ppa

# Update package lists after adding the PPA
sudo apt update  # Uncomment this line after adding the PPA URL

# Install the latest NVIDIA driver (adjust version as needed)
# You can find compatible driver versions on the NVIDIA website:
# https://www.nvidia.com/Download/index.aspx
echo "**Please check the NVIDIA website for compatible driver versions:**"
echo "https://www.nvidia.com/Download/index.aspx"
echo "**Update the following command with the desired driver version:**"
# Example (replace with the actual driver version):
sudo apt install nvidia-driver-535

# Install NVIDIA Container Toolkit (refer to official documentation for the latest version)
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
echo "**Please refer to the official NVIDIA documentation for the latest version:**"
echo "https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html"
echo "**Update the following command with the appropriate version:**"
# Example (replace with the actual version):
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
&& curl -s -L https://nvidia.github.io/libnvidia-container/ubuntu22.04/libnvidia-container.list | \
       sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
       sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
 && sudo apt update
 && sudo apt install -y nvidia-container-toolkit

# Configure the runtime (adjust commands based on installation method)
# If you used a PPA:
 sudo nvidia-container-runtime configure --runtime=docker
# If you used the official documentation steps:
 sudo nvidia-container-toolkit config --default-runtime=nvidia

# Restart the Docker daemon
sudo systemctl restart docker

# Verify installation (replace with the actual version you installed)
nvidia-smi
docker run --gpus all --rm nvidia/cuda:latest nvidia-smi

# Note: This script provides guidance but requires manual adjustments for PPA URL, driver version, and Container Toolkit installation commands.

echo "**Script complete. Please review the output and consult the official documentation for further instructions.**"
