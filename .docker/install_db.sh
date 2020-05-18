#!/usr/bin/env bash

docker cp pg_service.conf qgis:/etc/postgresql-common/

echo 'Installation from latest version'
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/00_initialize_database.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/10_FUNCTION.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/20_TABLE_SEQUENCE_DEFAULT.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/30_VIEW.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/40_INDEX.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/50_TRIGGER.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/60_CONSTRAINT.sql" > /dev/null
docker exec qgis bash -c "psql service=adresse -f /tests_directory/gestion_base_adresse/install/sql/adresse/70_COMMENT.sql" > /dev/null
