#!/bin/bash
set -e

docker stop nginx-web
docker rm nginx-web
docker rmi soravkumarsharma/nginx-staticwebpage:latest 