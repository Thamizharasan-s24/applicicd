#!/bin/bash

IMAGE_NAME="appli"
VERSION=$(date +%s)  # Use timestamp as version
.
docker build -t $IMAGE_NAME:$VERSION .
docker tag $IMAGE_NAME:$VERSION $IMAGE_NAME:latest  # Tag as latest too

echo "Image built: $IMAGE_NAME:$VERSION"
