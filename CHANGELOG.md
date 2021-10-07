# CHANGELOG

## Unreleased
* Upgrade join on view v_export_bal
* Upgrade join on view v_point_adresse
* Remove columns in lieu_dits
* Create edit view v_lieu_dits

## 0.8.0 - 2021-08-24
* Use the new QGIS Database API
* QGIS version 3.10 minimum from 0.8.0 of the plugin
* Upgrade Database structure
* Adding `BEGIN` and `COMMIT` in sql install file

## 0.7.0 - 2020-12-18

* Update Algorithm data_parcelle.py
  * Choose if we want load data or not with checkbox
  * Refactor code
  * Rename a prefix of view from `vue_` to `v_`
* Update view export_bal 
  * Rename with prefix `v_`
  * Rename field `date_dernier_maj` to `date_der_maj`
  * Update tests

## 0.6.0 - 2020-09-22

* Adding numbering certificate functionality
* Adding documentation

## 0.5.0 - 2020-07-21

* Update Trigger for calculate number of point by road
* Adding test for this trigger

## 0.4.0 - 2020-06-19

* Fix bugs
* Adding tests

## 0.3.0 - 2020-06-11

* Update Field a_valider, rename into valide
* Update QML for layers point_adresse and voie
* Adding tests for SQL function calcul_segment_proche

## 0.2.9 - 2020-05-27

* Adding multiple news tests
  * News tests to calculate address number in different situation
  * adding test if id_commune exist after insert new point
* Adding document import
* Adding triggers to get id commune after insert road or point
* Update database:
  * Adding et updating field to the export zip
  * Update function calcul_num_adr

## 0.2.8 - 2020-04-29

* Rename field sens into sens_numerotation in table voie
* Adding validation in point_adresse
* fix many bugs to close the deliverable 1
* Adding news units tests

## 0.2.7 - 2020-03-31

* Add test about structure bdd
* Add 2 view for export export BAL
* Update 2 functions to calcul num adresse, adding full array suffixe
* Update qml point_adresse

## 0.2.6 - 2020-03-13

* Fix migration from 0.2.5
* Add tests about migration from 0.2.3

## 0.2.5 - 2020-03-13

* Update schemaspy : https://docs.3liz.org/qgis-gestion_base_adresse-plugin/
* Update QML files
* Add comment, index and validation field
* Add trigger on voie to update nom_complet and adresse_complete
* Add project variables for two layers
* Improve unittest infrastructure

## 0.2.4 - 2020-03-06

* Database - Table definition, add default value to date_modif: DEFAULT NOW()
* Database - Trigger before update to manage user login between creator and modifier
* Database - Trigger before insert and update to generate fiel "longueur" in table voie
* Database - Table definition, add constraints NOT NULL
* Database - Trigger before insert for creator info
* rename ugrade sql file
* Publish docs database on github pages

## 0.2.3 - 2020-03-03

* Start testing the plugin with CI tools (Travis)
* Add load styles algorithm
* Code review

## 0.2.2 - 2020-03-02

* Database - Add spatial indexes
* Install - Improve SQL generator for Pg 9.5 compatibility issue

## 0.2.1 - 2020-02-28

* Database - Rename 4 columns of point_adresse
* Tools - Add missing method getVersionInteger
* Install - Add test data
* Fix wrong import
* Move processing algorithms, review all headers
* Move source code into gestion_base_adresse folder

## 0.2.0 - 2020-02-28

* Doc - Upgrade database doc with new metadata table
* Processing - Add alg to upgrade database structure
* Processing - New alg to create database structure
* Processing - rename the load layers alg
* remove unnecessary files/folders
* Move processing algs into processing subfolder
* Add gitignore & remove pycache files
* Installation - Ajout des scripts SQL et outil de génération automatique
* Doc - Ajout de la documentation SchemaSpy et des outils de génération
