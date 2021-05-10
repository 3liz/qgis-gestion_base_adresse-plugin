BEGIN;
--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Debian 10.15-1.pgdg100+1)
-- Dumped by pg_dump version 10.15 (Debian 10.15-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

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


-- commune.pt_hors_parcelle
COMMENT ON COLUMN adresse.commune.pt_hors_parcelle IS 'nombre de point adresse hors parcelle/commune';


-- commune.pt_hors_parcelle_valid
COMMENT ON COLUMN adresse.commune.pt_hors_parcelle_valid IS 'nombre de point  adresse réellement validés/commune';


-- commune.nb_pt_valide
COMMENT ON COLUMN adresse.commune.nb_pt_valide IS 'nombre de point adresse marqués comme validés par les users/commune';


-- commune.nb_pt_erreur
COMMENT ON COLUMN adresse.commune.nb_pt_erreur IS 'nombre de point adresse en erreur/commune';


-- commune.voie_non_valid
COMMENT ON COLUMN adresse.commune.voie_non_valid IS 'nombre de voies non validées/commune';


-- commune.voie_valid
COMMENT ON COLUMN adresse.commune.voie_valid IS 'nombre de voies  validées/commune';


-- commune.pct_voie_valid
COMMENT ON COLUMN adresse.commune.pct_voie_valid IS 'pourcentage de voie validé/commune';


-- commune.voie_total
COMMENT ON COLUMN adresse.commune.voie_total IS 'nombre de voies total/commune';


-- document.lien
COMMENT ON COLUMN adresse.document.lien IS 'Chemin de stockage du document';


-- metadata
COMMENT ON TABLE adresse.metadata IS 'Métadonnée de la structure du schéma, en lien avec la version du plugin QGIS. C''est utilisé pour les scripts de migration de la structure entre 2 versions.';


-- metadata.id
COMMENT ON COLUMN adresse.metadata.id IS 'Identifiant de la version';


-- metadata.me_version
COMMENT ON COLUMN adresse.metadata.me_version IS 'Version. Ex: 1.0.2';


-- metadata.me_version_date
COMMENT ON COLUMN adresse.metadata.me_version_date IS 'Date de la version. Ex: 2019-06-01';


-- parcelle.nb_pt_adresse
COMMENT ON COLUMN adresse.parcelle.nb_pt_adresse IS 'nombre de points adresse par parcelle';


-- parcelle.date_pt_modif
COMMENT ON COLUMN adresse.parcelle.date_pt_modif IS 'derniere modification des points adresse par parcelle';


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
COMMENT ON COLUMN adresse.point_adresse.id_voie IS 'Identifiant de la voie à laquelle appartient le point adresse';


-- point_adresse.id_commune
COMMENT ON COLUMN adresse.point_adresse.id_commune IS 'Identifiant de la commune à laquelle appartient le point adresse';


-- point_adresse.id_parcelle
COMMENT ON COLUMN adresse.point_adresse.id_parcelle IS 'Identifiant de la parcelle à laquelle appartient le point adresse';


-- point_adresse.valide
COMMENT ON COLUMN adresse.point_adresse.valide IS 'Le point d''adresse est valide ou non';


-- point_adresse.verif_terrain
COMMENT ON COLUMN adresse.point_adresse.verif_terrain IS 'la saisie du point adresse nécessite une vérification terrain';


-- point_adresse.complement_adresse
COMMENT ON COLUMN adresse.point_adresse.complement_adresse IS 'En minuscule et sans espace (ex : lesmimosas)';


-- point_adresse.lieudit_complement_nom
COMMENT ON COLUMN adresse.point_adresse.lieudit_complement_nom IS 'Nom du hameau ou lieu-dit local';


-- point_adresse.c_erreur_dist_voie
COMMENT ON COLUMN adresse.point_adresse.c_erreur_dist_voie IS 'identifie les points adresse plus près d’une autre voie que celle à laquelle il appartient';


-- point_adresse.c_dist_voie
COMMENT ON COLUMN adresse.point_adresse.c_dist_voie IS 'Calacul la distance entre le point adresse et sa voie de rattachement';


-- point_adresse.geom_pt_proj
COMMENT ON COLUMN adresse.point_adresse.geom_pt_proj IS 'geometrie du point adressse projeté sur sa voie de ratachement';


-- point_adresse.geom_segment_prolong
COMMENT ON COLUMN adresse.point_adresse.geom_segment_prolong IS 'géometrie du segment tracé entre le point adresse et le point projeté sur sa voie de ratachement. Prolongé de son 50/49e';


-- point_adresse.cote_voie
COMMENT ON COLUMN adresse.point_adresse.cote_voie IS 'indique la position du point par rapport à sa voie de ratachement : droite, gauche, indéfinie. Sinon problème (voie mal tracée, point non rattaché à une voie, ...)';


-- point_adresse.c_erreur_cote_parite
COMMENT ON COLUMN adresse.point_adresse.c_erreur_cote_parite IS 'identifie les points adresse pair ou impair du mauvais coté de la voie à laquelle il est rattaché : true (erreur coté), false (pas derreur) ou indefini. Sinon problème (voie mal tracée, point non rattaché à une voie, ...)';


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


-- voie.sens_numerotation
COMMENT ON COLUMN adresse.voie.sens_numerotation IS 'Si les nombres pairs sont à droite ou à gauche de la voie par rapport au sens de dessin';


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


-- voie.c_erreur_trace
COMMENT ON COLUMN adresse.voie.c_erreur_trace IS 'erreur de tracé de voies recourbées sur ou vers elles mêmes';


-- voie.c_repet_nom_voie
COMMENT ON COLUMN adresse.voie.c_repet_nom_voie IS 'voie portant le même nom qu1 autre voie de la même commune';


-- voie.c_long_nom
COMMENT ON COLUMN adresse.voie.c_long_nom IS 'voie portant un nom de plus de 24 charactères';


-- voie.c_repet_num
COMMENT ON COLUMN adresse.voie.c_repet_num IS 'voies avec repetition de numéro sur les points adresses qui lui sont associés';


-- voie.c_saisie_double
COMMENT ON COLUMN adresse.voie.c_saisie_double IS 'Voies à moins de 50 mètres de distance portant le même nom';


--
-- PostgreSQL database dump complete
--


COMMIT;
