#!/bin/bash
set -e

#Pull the docker image from the dockerHub.
docker pull soravkumarsharma/nginx-staticwebpage:latest

#Run the docker pulled docker image.
docker run -d -p 80:80 --name nginx-web soravkumarsharma/nginx-staticwebpage:latest
