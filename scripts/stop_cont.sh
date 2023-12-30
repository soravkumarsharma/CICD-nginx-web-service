#!/bin/bash
set -e
#docker container stopped 
docker stop nginx-web
docker rm nginx-web
docker rmi soravkumarsharma/nginx-staticwebpage:latest 
