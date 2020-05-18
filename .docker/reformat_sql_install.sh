#!/usr/bin/env bash

docker exec qgis bash -c "apt-get install -y rename" > /dev/null

echo 'Generating SQL files'
docker exec qgis bash -c "cd /tests_directory/gestion_base_adresse/install/sql/ && ./export_database_structure_to_SQL.sh adresse adresse"

docker exec qgis bash -c "cd /tests_directory/gestion_base_adresse/install/sql/adresse && chmod 777 *.sql"
