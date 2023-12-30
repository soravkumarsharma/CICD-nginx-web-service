#!/bin/bash
set -e
#docker container stopped 
containerid = `docker ps | awk -F " " '{print $1}'`
docker stop containerid
docker rm containerid 
docker rmi $(docker images -a -q)
