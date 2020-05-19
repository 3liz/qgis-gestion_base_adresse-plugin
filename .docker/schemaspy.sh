#!/usr/bin/env bash
SCHEMA="adresse"

docker run \
  -v "${PWD}/../docs:/output" \
  --network=docker_plugin_adresse_network \
  etrimaille/docker-schemaspy-pg:latest \
  -t pgsql-mat \
  -dp /drivers \
  -host db \
  -db gis \
  -u docker \
  -p docker \
  -port 5432 \
  -s ${SCHEMA}
