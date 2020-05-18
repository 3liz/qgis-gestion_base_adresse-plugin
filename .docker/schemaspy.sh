#!/usr/bin/env bash

docker run \
  -v "${PWD}/../docs:/output" \
  -v "${PWD}/schemaspy.properties:/schemaspy.properties" \
  --network=docker_adress_network \
  etrimaille/docker-schemaspy-pg:latest \
  -dp /driver \
  -pfp adresse
