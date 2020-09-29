---
Title: Gestion des adresses
Favicon: ../icon.png
Up: True
...

[TOC]

# Gestion des adresses

## Outils


### Configuration du projet

La configuration ajoute les variables concernant le nom des couches dans le projet.

![algo_id](./gestion_adresse-config_project.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
ADDRESS_LAYER|Voirie|VectorLayer||✓||Type: TypeVectorLine <br>|
STREET_LAYER|Point adresse|VectorLayer||✓||Type: TypeVectorPoint <br>|


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
No output

***


## Structure


### Installation de la structure sur la base de données

Création de la structure de la base données. Vous pouvez aussi charger des données de tests.

![algo_id](./gestion_adresse-create_database_structure.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
CONNECTION_NAME|Connexion PostgreSQL vers la base de données|String||✓|||
OVERRIDE|Écraser le schéma adresse ? ** ATTENTION ** Cela supprimera toutes les données !|Boolean||✓|||
ADD_TEST_DATA|Ajouter des données de test ?|Boolean||✓|||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Output status|Number||
OUTPUT_STRING|Output message|String||


***


### Mise à jour de la structure de la base

Mise à jour de la base de données suite à une nouvelle version de l'extension.

![algo_id](./gestion_adresse-upgrade_database_structure.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
CONNECTION_NAME|Connexion PostgreSQL vers la base de données|String||✓|||
RUN_MIGRATIONS|Cocher cette option pour lancer la mise-à-jour.|Boolean||✓|||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Output status|Number||
OUTPUT_STRING|Output message|String||


***


## Données


### Mise en place des données pour certificat de numérotation

Ajout des données parcellaire et création des vues pour les certificats de numérotation.

![algo_id](./gestion_adresse-data_parcelle.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
DATABASE|Connexion à la base de données|String||✓|||
SCHEMA|Schéma du cadastre contenant les données des parcelles est propriétaires|String||||Default: cadastre <br> |


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT|Couches de sortie|MultipleLayers||
OUTPUT MSG|Message de sortie|String||


***


### Chargement des couches depuis la base

Charger toutes les couches de la base de données.

![algo_id](./gestion_adresse-load_layers.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
DATABASE|Connexion à la base de données|String||✓|||
SCHEMA|Schéma|String||||Default: adresse <br> |


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT|Couches de sortie|MultipleLayers||
OUTPUT MSG|Message de sortie|String||


***


### Chargement des styles depuis le dossier resources

Charger les styles pour les différentes couches.

![algo_id](./gestion_adresse-load_styles.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
INPUT|Champ qui ne sert à rien !|String|||||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT MSG|Message de sortie|String||


***

