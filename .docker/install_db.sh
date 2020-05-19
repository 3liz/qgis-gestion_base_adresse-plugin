#!/usr/bin/env bash

docker cp pg_service.conf qgis:/etc/postgresql-common/

echo 'Installation from latest version'
docker exec qgis bash -c "psql service=adresse -c 'DROP SCHEMA IF EXISTS adresse CASCADE;'" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/00_initialize_database.sql" > /dev/null
for sql_file in `ls -v ../gestion_base_adresse/install/sql/adresse/*.sql`; do
  echo "${sql_file}"
  docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/${sql_file}" > /dev/null;
  done;
