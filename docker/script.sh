#!/bin/bash

docker-compose up

sleep 10

docker exec -it qgis rm -f  /root/.local/share/QGIS/QGIS3/profiles/default/python/plugins/gestion_base_adresse
docker exec -it qgis ln -s /gestion_base_adresse/ /root/.local/share/QGIS/QGIS3/profiles/default/python/plugins/gestion_base_adresse
docker exec -it qgis sh -c "qgis_setup.sh gestion_base_adresse"
docker cp postgis_connexions.ini qgis:/tmp
docker exec qgis bash -c "cat /tmp/postgis_connexions.ini >> /root/.local/share/QGIS/QGIS3/profiles/default/QGIS/QGIS3.ini"
docker exec qgis qgis
