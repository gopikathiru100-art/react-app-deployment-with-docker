#!/bin/bash

# Exit immediately if a command fails
set -e

# Variables
IMAGE_NAME=react-ci-cd
DOCKER_REPO=$DOCKER_USERNAME/$IMAGE_NAME

# Login to Docker Hub securely
echo $DOCKER_PASS | docker login -u $DOCKER_USERNAME --password-stdin

# Stop and remove old container if exists
docker stop react || true
docker rm react || true

# Enable BuildKit for modern builds and build image
DOCKER_BUILDKIT=1 docker build -t $DOCKER_REPO:latest .

# Push image to Docker Hub
docker push $DOCKER_REPO:latest

# Run container locally on Jenkins server
docker run -d --name react -p 80:80 $DOCKER_REPO:latest
