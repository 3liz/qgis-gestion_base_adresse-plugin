#!/usr/bin/env bash

echo 'Installing the service file'
docker cp pg_service.conf qgis:/etc/postgresql-common/

echo 'Installation from version 0.2.3'
docker exec qgis bash -c "psql service=adresse -c 'DROP SCHEMA IF EXISTS adresse CASCADE;'" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/test/data/install/sql/00_initialize_database.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/test/data/install/sql/adresse/10_FUNCTION.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/test/data/install/sql/adresse/20_TABLE_SEQUENCE_DEFAULT.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/test/data/install/sql/adresse/30_VIEW.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/test/data/install/sql/adresse/40_INDEX.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/test/data/install/sql/adresse/50_TRIGGER.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/test/data/install/sql/adresse/60_CONSTRAINT.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/test/data/install/sql/adresse/70_COMMENT.sql" > /dev/null

echo 'Run migrations'
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/upgrade/upgrade_to_0.2.4.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/upgrade/upgrade_to_0.2.5.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/upgrade/upgrade_to_0.2.7.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/upgrade/upgrade_to_0.2.8.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/upgrade/upgrade_to_0.2.9.sql" > /dev/null

echo 'Generate doc'
docker exec qgis bash -c "apt-get install -y rename" > /dev/null
docker exec qgis bash -c "cd /tests_directory/gestion_base_adresse/install/sql/ && ./export_database_structure_to_SQL.sh adresse adresse"
docker exec qgis bash -c "cd /tests_directory/gestion_base_adresse/install/sql/adresse && chmod 777 *.sql"

git diff
[[ -z $(git status -s) ]]
exit $?
