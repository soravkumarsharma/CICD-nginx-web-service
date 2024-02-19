#!/bin/bash

set -e

DOCKERHUB_USERNAME="soravkumarsharma"
DOCKER_IMAGE="nginx-cicd"
DOCKERFILE_PATH=""
DOCKER_CONT_NAME="nginx_cont"
GIT_CLONE_URL="https://github.com/soravkumarsharma/CICD-nginx-web-service.git"

echo "-------------Setting Up Workspace-------------"
temp_dir="/home/$USER/workspace"
mkdir -p "$temp_dir"
echo "Workspace directory: $temp_dir"

echo "-------------Git Checkout-------------"
git clone "$GIT_CLONE_URL" "$temp_dir"

echo "-------------Docker Build-------------"
cd "$temp_dir/$DOCKERFILE_PATH"
docker build -t "$DOCKERHUB_USERNAME/$DOCKER_IMAGE" .

echo "-------------Docker Run-------------"
if docker ps -q --filter "name=$DOCKER_CONT_NAME" >/dev/null; then
    echo "Stopping and removing the running container..."
    docker container stop "$DOCKER_CONT_NAME"
    docker container rm -f "$DOCKER_CONT_NAME"
else
    echo "No running container with the name $DOCKER_CONT_NAME found."
fi
docker run -d -p 80:80 --name "$DOCKER_CONT_NAME" "$DOCKERHUB_USERNAME/$DOCKER_IMAGE:latest"

echo "-------------CleanUp the Workspace-------------"
rm -rf $temp_dir

