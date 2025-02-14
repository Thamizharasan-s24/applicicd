#!/bin/bash

# Variables
IMAGE_NAME="appli"       # The name of your Docker image
CONTAINER_NAME="mcontainer"  # The name of the running container
EC2_HOST="3.86.162.27"  # EC2 Public IP (can be obtained from your AWS console)

# 1. SSH into EC2 instance (if you're running the deploy script locally)
echo "Stopping and removing any existing container..."

# Stop and remove the existing container (if any)
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

# 2. Run the new container with the latest image
echo "Deploying the latest version of the app..."

# Run the container in detached mode
docker run -d -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME:latest

echo "Application deployed successfully to EC2!"

# Optional: Check container status
docker ps
