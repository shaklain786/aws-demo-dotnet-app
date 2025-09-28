#!/bin/bash
set -e

# Docker Hub credentials - replace securely in production
DOCKER_USERNAME="iamshaklain"
DOCKER_PASSWORD="8583979684"

# Login to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Pull private image
docker pull iamshaklain/sample-dotnet-aws

# Stop & remove existing container if running
CONTAINER_NAME="my-dotnet-app"
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Run container
docker run -d -p 8080:8080 -p 8081:8081 --name $CONTAINER_NAME iamshaklain/sample-dotnet-aws
