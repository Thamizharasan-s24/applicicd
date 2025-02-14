#!/bin/bash

IMAGE_NAME="appli"

# Run the Docker container in the background
docker run -d -p 8080:80 --name my-running-app $IMAGE_NAME:latest

# Wait for the container to start
sleep 2

# Check if the web server is up by hitting the local URL
curl -f http://localhost:8080

# Check the result of the curl command
if [ $? -eq 0 ]; then
    echo "Test passed!"
else
    echo "Test failed!"
    exit 1
fi

# Clean up the container
docker stop my-running-app
docker rm my-running-app
