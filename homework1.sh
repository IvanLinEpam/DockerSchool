#!/bin/bash
docker network create webapp

docker build -t frontend ./frontend
docker run -d -p 8081:80 --name frontend --network=webapp frontend
