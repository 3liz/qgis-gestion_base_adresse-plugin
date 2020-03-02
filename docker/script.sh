#!/bin/bash

echo 'Start docker-compose'
docker-compose up -d --force-recreate

echo 'Wait 10 seconds'
sleep 10

echo 'Installation of the plugin'
docker exec -it qgis rm -f  /root/.local/share/QGIS/QGIS3/profiles/default/python/plugins/gestion_base_adresse
docker exec -it qgis ln -s /gestion_base_adresse/ /root/.local/share/QGIS/QGIS3/profiles/default/python/plugins/gestion_base_adresse
docker exec -it qgis sh -c "qgis_setup.sh gestion_base_adresse"
docker cp postgis_connexions.ini qgis:/tmp
docker exec qgis bash -c "cat /tmp/postgis_connexions.ini >> /root/.local/share/QGIS/QGIS3/profiles/default/QGIS/QGIS3.ini"

echo 'Running tests'
docker exec -it qgis sh -c "cd /gestion_base_adresse && qgis_testrunner.sh qgis_plugin_tools.infrastructure.test_runner.test_package"
# docker exec qgis qgis
docker-compose kill
docker-compose rm

echo 'Tests finished, DB is still running'