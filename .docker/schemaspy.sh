#!/usr/bin/env bash

docker run \
  -v "${PWD}/../docs:/output" \
  --network=docker_adress_network \
  etrimaille/docker-schemaspy-pg:latest \
  -t pgsql-mat \
  -dp /drivers \
  -host db \
  -db gis \
  -u docker \
  -p docker \
  -port 5432 \
  -debug \
  -s adresse
