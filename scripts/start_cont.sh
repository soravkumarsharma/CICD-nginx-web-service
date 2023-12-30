#!/bin/bash
set -e

#Pull the docker image from the dockerHub.
docker push soravkumarsharma/nginx-staticwebpage:latest

#Run the docker pulled docker image.
docker run -d -p 80:80 soravkumarsharma/nginx-staticwebpage:latest
