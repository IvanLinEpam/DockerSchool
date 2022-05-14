#!bin/bash
docker network create webapp

docker run --name database \
            -v ${PWD}/db_data:/var/lib/postgresql/data \
            --network=webapp \
            -p 5432:5432 \
            -e POSTGRES_USER=django \
            -e POSTGRES_PASSWORD=django \
            -e POSTGRES_DB=django \
            -e PGDATA=/var/lib/postgresql/data \
            -d \
            postgres:14

docker build -t server -f ./lib_catalog/Dockerfile ./lib_catalog

docker run --name server \
            --network=webapp \
            -p 8000:8000 \
            -dit \
            server:latest
