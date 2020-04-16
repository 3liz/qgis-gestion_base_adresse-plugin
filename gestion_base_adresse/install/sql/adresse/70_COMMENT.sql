--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6 (Ubuntu 11.6-1.pgdg19.04+1)
-- Dumped by pg_dump version 11.6 (Ubuntu 11.6-1.pgdg19.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- commune.id_com
COMMENT ON COLUMN adresse.commune.id_com IS 'Identifiant unique de la commune';


-- commune.commune_nom
COMMENT ON COLUMN adresse.commune.commune_nom IS 'Nom de la commune';


-- commune.insee_code
COMMENT ON COLUMN adresse.commune.insee_code IS 'Code INSEE de la commune';


-- commune.intercom
COMMENT ON COLUMN adresse.commune.intercom IS 'Intercommunalité dans laquelle la commune se trouve';


-- commune.fibre
COMMENT ON COLUMN adresse.commune.fibre IS 'Situation de la commune dans le déploiement de la fibre';


-- commune.phase_fibre
COMMENT ON COLUMN adresse.commune.phase_fibre IS 'Numéro de phase du déploiement de la fibre sur la commune';


-- commune.actif
COMMENT ON COLUMN adresse.commune.actif IS 'Si la commune se fait accompagner par le département';


-- commune.nom_referent
COMMENT ON COLUMN adresse.commune.nom_referent IS 'Nom et Prénom de la personne référente sur le projet d’adressage dans la commune';


-- commune.tel_referent
COMMENT ON COLUMN adresse.commune.tel_referent IS 'Numéro de téléphone de la personne référente sur le projet d’adressage dans la commune';


-- commune.mail_referent
COMMENT ON COLUMN adresse.commune.mail_referent IS 'Adresse mail de la personne référente sur le projet d’adressage dans la commune';


-- commune.situation
COMMENT ON COLUMN adresse.commune.situation IS 'État d’avancement du projet d’adressage de la commune';


-- commune.commenter
COMMENT ON COLUMN adresse.commune.commenter IS 'Commentaires généraux sur le projet de la commune, l’avancement, le dernier contact, le prochain rendez-vous';


-- commune.date_delib
COMMENT ON COLUMN adresse.commune.date_delib IS 'Date à laquelle la délibération sur les dénominations des voies a été prise.';


-- commune.diffusion_dgfip
COMMENT ON COLUMN adresse.commune.diffusion_dgfip IS 'Les adresses ont-elles été envoyées à la DGFIP ?';


-- commune.date_dgfip
COMMENT ON COLUMN adresse.commune.date_dgfip IS 'Date d’envoi des données à la DGFIP.';


-- commune.diffusion_ban
COMMENT ON COLUMN adresse.commune.diffusion_ban IS 'Les adresses ont-elles été remontées dans la Base Adresse Nationale ?';


-- commune.date_ban
COMMENT ON COLUMN adresse.commune.date_ban IS 'Date d’envoi des données dans la BAN.';


-- commune.geom
COMMENT ON COLUMN adresse.commune.geom IS 'Geometrie de l''objet';


-- point_adresse.id_point
COMMENT ON COLUMN adresse.point_adresse.id_point IS 'Identifiant unique du point adresse';


-- point_adresse.numero
COMMENT ON COLUMN adresse.point_adresse.numero IS 'Numéro de l’adresse';


-- point_adresse.suffixe
COMMENT ON COLUMN adresse.point_adresse.suffixe IS 'Extension du numéro (bis, ter, A, B...)';


-- point_adresse.adresse_complete
COMMENT ON COLUMN adresse.point_adresse.adresse_complete IS 'Concaténation du numéro, de l’extension, de la typologie et du nom de la voie';


-- point_adresse.code_postal
COMMENT ON COLUMN adresse.point_adresse.code_postal IS 'Code postal auquel appartient de point adresse';


-- point_adresse.type_pos
COMMENT ON COLUMN adresse.point_adresse.type_pos IS 'Type de positionnement du point adresse';


-- point_adresse.achat_plaque_numero
COMMENT ON COLUMN adresse.point_adresse.achat_plaque_numero IS 'Achat de la plaque nécessaire ou non ?';


-- point_adresse.createur
COMMENT ON COLUMN adresse.point_adresse.createur IS 'Nom de l’utilisateur qui a créé le point';


-- point_adresse.date_creation
COMMENT ON COLUMN adresse.point_adresse.date_creation IS 'Date et heure à laquelle le point adresse a été créé';


-- point_adresse.modificateur
COMMENT ON COLUMN adresse.point_adresse.modificateur IS 'Nom de l’utilisateur qui a effectué la dernière modification';


-- point_adresse.date_modif
COMMENT ON COLUMN adresse.point_adresse.date_modif IS 'Date et heure à laquelle la dernière modification sur la fiche du point a été apportée';


-- point_adresse.erreur
COMMENT ON COLUMN adresse.point_adresse.erreur IS 'Présence d’une erreur ou non';


-- point_adresse.commentaire
COMMENT ON COLUMN adresse.point_adresse.commentaire IS 'Commentaire';


-- point_adresse.geom
COMMENT ON COLUMN adresse.point_adresse.geom IS 'Géométrie de l’objet';


-- point_adresse.id_voie
COMMENT ON COLUMN adresse.point_adresse.id_voie IS 'Indentifiant de la voie à la qu''elle appartient le point adresse';


-- point_adresse.id_commune
COMMENT ON COLUMN adresse.point_adresse.id_commune IS 'Indentifiant de la commune à la qu''elle appartient le point adresse';


-- point_adresse.id_parcelle
COMMENT ON COLUMN adresse.point_adresse.id_parcelle IS 'Indentifiant de la parcelle à la qu''elle appartient le point adresse';


-- voie.id_voie
COMMENT ON COLUMN adresse.voie.id_voie IS 'Identifiant unique de la voie';


-- voie.typologie
COMMENT ON COLUMN adresse.voie.typologie IS 'Typologie de la voie';


-- voie.nom
COMMENT ON COLUMN adresse.voie.nom IS 'Nom de la voie';


-- voie.nom_complet
COMMENT ON COLUMN adresse.voie.nom_complet IS 'Concaténation de la typologie et du nom de la voie';


-- voie.type_num
COMMENT ON COLUMN adresse.voie.type_num IS 'Type de numérotation de la voie';


-- voie.statut_voie_num
COMMENT ON COLUMN adresse.voie.statut_voie_num IS 'Statut accordé à la voie permettant son verrouillage ou son déverrouillage pour la saisie d’une adresse';


-- voie.statut_voie
COMMENT ON COLUMN adresse.voie.statut_voie IS 'Statut accordé à la voie au niveau du plan d’adressage';


-- voie.sens
COMMENT ON COLUMN adresse.voie.sens IS 'Défini si la numérotation pair est à droite du sens de la géométrie de la voie';


-- voie.achat_plaque_voie
COMMENT ON COLUMN adresse.voie.achat_plaque_voie IS 'Achat de la plaque nécessaire ou non ?';


-- voie.nb_point
COMMENT ON COLUMN adresse.voie.nb_point IS 'Nombre de points adresses rattachés à cette voie';


-- voie.createur
COMMENT ON COLUMN adresse.voie.createur IS 'Nom de l’utilisateur qui a créé la voie';


-- voie.date_creation
COMMENT ON COLUMN adresse.voie.date_creation IS 'Date et heure à laquelle la voie a été créée';


-- voie.modificateur
COMMENT ON COLUMN adresse.voie.modificateur IS 'Nom de l’utilisateur qui a effectué la dernière modification';


-- voie.date_modif
COMMENT ON COLUMN adresse.voie.date_modif IS 'Date et heure à laquelle la dernière modification sur la fiche de la voie a été apportéee';


-- voie.longueur
COMMENT ON COLUMN adresse.voie.longueur IS 'Longueur de la voie en mètres';


-- voie.code_fantoir
COMMENT ON COLUMN adresse.voie.code_fantoir IS 'Code fantoir pour de la DGFIP';


-- voie.delib
COMMENT ON COLUMN adresse.voie.delib IS 'Spécifie si la commune souhaite délibérer sur la voie';


-- voie.geom
COMMENT ON COLUMN adresse.voie.geom IS 'Géométrie de l’objet';


-- metadata
COMMENT ON TABLE adresse.metadata IS 'Métadonnée de la structure du schéma, en lien avec la version du plugin QGIS. C''est utilisé pour les scripts de migration de la structure entre 2 versions.';


-- metadata.id
COMMENT ON COLUMN adresse.metadata.id IS 'Identifiant de la version';


-- metadata.me_version
COMMENT ON COLUMN adresse.metadata.me_version IS 'Version. Ex: 1.0.2';


-- metadata.me_version_date
COMMENT ON COLUMN adresse.metadata.me_version_date IS 'Date de la version. Ex: 2019-06-01';


--
-- PostgreSQL database dump complete
--
