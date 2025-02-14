#!/bin/bash

IMAGE_NAME="appli"

# Run a container in the background
docker run -d -p 8089:80 $IMAGE_NAME:latest &
CONTAINER_ID=$!

# Give it a second to start
sleep 1

# Check if the server responds
curl http://localhost:8089 > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    echo "Test passed!"
else
    echo "Test failed!"
    docker logs $CONTAINER_ID  # Show container logs if test fails
    exit 1
fi

# Stop and remove the container
docker stop $CONTAINER_ID
docker rm $CONTAINER_ID
