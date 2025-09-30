#!/bin/bash

# Exit immediately if a command fails
set -e

# Login to Docker Hub securely
echo $DOCKER_PASS | docker login -u $DOCKER_USERNAME --password-stdin

# Stop and remove old container if exists
docker stop react || true
docker rm react || true

# Enable BuildKit for modern builds
DOCKER_BUILDKIT=1 docker build -t react-ci/cd .

# Run container on port 80
docker run -d --name react -p 80:80 react-ci/cd
