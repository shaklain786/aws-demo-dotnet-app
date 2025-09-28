#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Define the container name (replace with your container's actual name)
CONTAINER_NAME="my-dotnet-app"

# Check if the container is running
#if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping running container: $CONTAINER_NAME"
    #docker stop $CONTAINER_NAME
    echo "Container $CONTAINER_NAME stopped."
#else
    echo "No running container named $CONTAINER_NAME found."
#fi
