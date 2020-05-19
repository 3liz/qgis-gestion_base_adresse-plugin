#!/usr/bin/env bash
SCHEMA="adresse"
NETWORK="plugin_adresse_network"

docker run \
  -v "${PWD}/../docs:/output" \
  --network=docker_${NETWORK} \
  etrimaille/docker-schemaspy-pg:latest \
  -t pgsql-mat \
  -dp /drivers \
  -host db \
  -db gis \
  -u docker \
  -p docker \
  -port 5432 \
  -s ${SCHEMA}
