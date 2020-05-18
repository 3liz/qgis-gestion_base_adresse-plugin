#!/usr/bin/env bash

docker run \
  -v "${PWD}/../docs:/output" \
  -v "${PWD}/schemaspy.properties:/schemaspy.properties" \
  --network=docker_adresse_network schematest \
  -dp /driver \
  -pfp adresse
