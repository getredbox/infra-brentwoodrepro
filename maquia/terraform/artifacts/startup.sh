#!/bin/bash

# Install Docker
## Doc: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html
sudo yum update -y
echo "Completed: sudo yum update -y"

## Install the most recent Docker Engine package.
sudo amazon-linux-extras install docker -y
echo "Completed: sudo amazon-linux-extras install docker -y"

## Start Docker service
sudo service docker start
echo "Completed: sudo service docker start"

## Add the ec2-user to the docker group so you can execute Docker commands without using sudo.
sudo usermod -a -G docker ec2-user
echo "Completed: sudo usermod -a -G docker ec2-user"

## Add as a service to boot on startup.
sudo systemctl enable docker
echo "Completed: sudo systemctl enable docker"
sudo systemctl start docker
echo "Completed: sudo systemctl start docker"


# Install Docker Compose
## Doc: https://docs.docker.com/compose/install/
## Get the latest version from the documentation.
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Completed: curl, chmod"


# Create directory that will house the projects.
sudo mkdir /var/www
sudo chown ec2-user:ec2-user /var/www
echo "Completed: mkdir, chown"


# Completed
echo "Completed all commands for data.sh"
