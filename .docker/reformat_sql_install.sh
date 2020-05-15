#!/usr/bin/env bash

docker cp pg_service.conf qgis:/etc/postgresql-common/
docker exec qgis bash -c "apt-get install -y rename" > /dev/null

echo 'Installation from latest version'
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/00_initialize_database.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/10_FUNCTION.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/20_TABLE_SEQUENCE_DEFAULT.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/30_VIEW.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/40_INDEX.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/50_TRIGGER.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/60_CONSTRAINT.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/70_COMMENT.sql" > /dev/null

echo 'Generating SQL files'
docker exec qgis bash -c "cd /tests_directory/gestion_base_adresse/install/sql/ && ./export_database_structure_to_SQL.sh adresse adresse"

docker exec qgis bash -c "cd /tests_directory/gestion_base_adresse/install/sql/adresse && chmod 777 *.sql"
