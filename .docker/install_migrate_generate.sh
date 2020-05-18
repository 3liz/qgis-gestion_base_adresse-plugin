#!/usr/bin/env bash

echo 'Installing the service file'
docker cp pg_service.conf qgis:/etc/postgresql-common/

echo 'Installation from version 0.2.3'
docker exec qgis bash -c "psql service=adresse -c 'DROP SCHEMA IF EXISTS adresse CASCADE;'" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/test/data/install/sql/00_initialize_database.sql" > /dev/null
for sql_file in `ls -v ../gestion_base_adresse/test/data/install/sql/adresse/*.sql`; do
  echo "${sql_file}"
  docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/${sql_file}" > /dev/null;
  done;

echo 'Run migrations'
for migration in `ls -v ../gestion_base_adresse/install/sql/upgrade/*.sql`; do
  echo "${migration}"
  docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/${migration}" > /dev/null;
  done;

echo 'Generate doc'
docker exec qgis bash -c "apt-get install -y rename" > /dev/null
docker exec qgis bash -c "cd /tests_directory/gestion_base_adresse/install/sql/ && ./export_database_structure_to_SQL.sh adresse adresse"
docker exec qgis bash -c "cd /tests_directory/gestion_base_adresse/install/sql/adresse && chmod 777 *.sql"

git diff
[[ -z $(git status -s) ]]
exit $?
