#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    sudo yum update -y
    sudo yum install -y docker

    # Start and enable Docker
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add the current user to the Docker group
    sudo usermod -aG docker ec2-user
    echo "Docker installed successfully."
else
    echo "Docker Found"
fi

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Installing AWS CLI..."
    sudo yum install -y aws-cli
else
    echo "AWS CLI is already installed."
fi