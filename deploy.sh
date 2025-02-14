#!/bin/bash

IMAGE_NAME="appli"

# Stop any existing container (if any)
docker stop my-running-app 2>/dev/null  # Ignore error if no container exists
docker rm my-running-app 2>/dev/null

docker run -d -p 80:80 --name my-running-app $IMAGE_NAME:latest

echo "Application deployed!"
