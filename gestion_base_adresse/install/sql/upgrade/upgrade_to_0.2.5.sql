BEGIN;

COMMENT ON COLUMN adresse.point_adresse.id_point IS 'Identifiant unique du point adresse';
COMMENT ON COLUMN adresse.point_adresse.numero IS 'Numéro de l’adresse';
COMMENT ON COLUMN adresse.point_adresse.suffixe IS 'Extension du numéro (bis, ter, A, B...)';
COMMENT ON COLUMN adresse.point_adresse.adresse_complete IS 'Concaténation du numéro, de l’extension, de la typologie et du nom de la voie';
COMMENT ON COLUMN adresse.point_adresse.code_postal IS 'Code postal auquel appartient de point adresse';
COMMENT ON COLUMN adresse.point_adresse.type_pos IS 'Type de positionnement du point adresse';
COMMENT ON COLUMN adresse.point_adresse.achat_plaque_numero IS 'Achat de la plaque nécessaire ou non ?';
COMMENT ON COLUMN adresse.point_adresse.createur IS 'Nom de l’utilisateur qui a créé le point';
COMMENT ON COLUMN adresse.point_adresse.date_creation IS 'Date et heure à laquelle le point adresse a été créé';
COMMENT ON COLUMN adresse.point_adresse.modificateur IS 'Nom de l’utilisateur qui a effectué la dernière modification';
COMMENT ON COLUMN adresse.point_adresse.date_modif IS 'Date et heure à laquelle la dernière modification sur la fiche du point a été apportée';
COMMENT ON COLUMN adresse.point_adresse.erreur IS 'Présence d’une erreur ou non';
COMMENT ON COLUMN adresse.point_adresse.commentaire IS 'Commentaire';
COMMENT ON COLUMN adresse.point_adresse.geom IS 'Géométrie de l’objet';
COMMENT ON COLUMN adresse.point_adresse.id_voie IS 'Indentifiant de la voie à la qu''elle appartient le point adresse';
COMMENT ON COLUMN adresse.point_adresse.id_commune IS 'Indentifiant de la commune à la qu''elle appartient le point adresse';
COMMENT ON COLUMN adresse.point_adresse.id_parcelle IS 'Indentifiant de la parcelle à la qu''elle appartient le point adresse';

COMMENT ON COLUMN adresse.voie.id_voie IS 'Identifiant unique de la voie';
COMMENT ON COLUMN adresse.voie.typologie IS 'Typologie de la voie';
COMMENT ON COLUMN adresse.voie.nom IS 'Nom de la voie';
COMMENT ON COLUMN adresse.voie.nom_complet IS 'Concaténation de la typologie et du nom de la voie';
COMMENT ON COLUMN adresse.voie.type_num IS 'Type de numérotation de la voie';
COMMENT ON COLUMN adresse.voie.statut_voie_num IS 'Statut accordé à la voie permettant son verrouillage ou son déverrouillage pour la saisie d’une adresse';
COMMENT ON COLUMN adresse.voie.statut_voie IS 'Statut accordé à la voie au niveau du plan d’adressage';
COMMENT ON COLUMN adresse.voie.createur IS 'Nom de l’utilisateur qui a créé la voie';
COMMENT ON COLUMN adresse.voie.date_creation IS 'Date et heure à laquelle la voie a été créée';
COMMENT ON COLUMN adresse.voie.modificateur IS 'Nom de l’utilisateur qui a effectué la dernière modification';
COMMENT ON COLUMN adresse.voie.date_modif IS 'Date et heure à laquelle la dernière modification sur la fiche de la voie a été apportéee';
COMMENT ON COLUMN adresse.voie.sens IS 'Stocke l’information si la voie à été changé de sens';
COMMENT ON COLUMN adresse.voie.achat_plaque_voie IS 'Achat de la plaque nécessaire ou non ?';
COMMENT ON COLUMN adresse.voie.geom IS 'Géométrie de l’objet';
COMMENT ON COLUMN adresse.voie.nb_point IS 'Nombre de points adresses rattachés à cette voie';
COMMENT ON COLUMN adresse.voie.longueur IS 'Longueur de la voie en mètres';
COMMENT ON COLUMN adresse.voie.code_fantoir IS 'Code fantoir pour de la DGFIP';
COMMENT ON COLUMN adresse.voie.delib IS 'Spécifie si la commune souhaite délibérer sur la voie';

COMMENT ON COLUMN adresse.commune.id_com IS 'Identifiant unique de la commune';
COMMENT ON COLUMN adresse.commune.commune_nom IS 'Nom de la commune';
COMMENT ON COLUMN adresse.commune.insee_code IS 'Code INSEE de la commune';
COMMENT ON COLUMN adresse.commune.intercom IS 'Intercommunalité dans laquelle la commune se trouve';
COMMENT ON COLUMN adresse.commune.fibre IS 'Situation de la commune dans le déploiement de la fibre';
COMMENT ON COLUMN adresse.commune.phase_fibre IS 'Numéro de phase du déploiement de la fibre sur la commune';
COMMENT ON COLUMN adresse.commune.actif IS 'Si la commune se fait accompagner par le département';
COMMENT ON COLUMN adresse.commune.nom_referent IS 'Nom et Prénom de la personne référente sur le projet d’adressage dans la commune';
COMMENT ON COLUMN adresse.commune.tel_referent IS 'Numéro de téléphone de la personne référente sur le projet d’adressage dans la commune';
COMMENT ON COLUMN adresse.commune.mail_referent IS 'Adresse mail de la personne référente sur le projet d’adressage dans la commune';
COMMENT ON COLUMN adresse.commune.situation IS 'État d’avancement du projet d’adressage de la commune';
COMMENT ON COLUMN adresse.commune.commenter IS 'Commentaires généraux sur le projet de la commune, l’avancement, le dernier contact, le prochain rendez-vous';
COMMENT ON COLUMN adresse.commune.date_delib IS 'Date à laquelle la délibération sur les dénominations des voies a été prise.';
COMMENT ON COLUMN adresse.commune.diffusion_dgfip IS 'Les adresses ont-elles été envoyées à la DGFIP ?';
COMMENT ON COLUMN adresse.commune.date_dgfip IS 'Date d’envoi des données à la DGFIP.';
COMMENT ON COLUMN adresse.commune.diffusion_ban IS 'Les adresses ont-elles été remontées dans la Base Adresse Nationale ?';
COMMENT ON COLUMN adresse.commune.date_ban IS 'Date d’envoi des données dans la BAN.';
COMMENT ON COLUMN adresse.commune.geom IS 'Geometrie de l''objet';

CREATE INDEX if not exists index_voie_adr ON adresse.point_adresse(id_voie);
CREATE INDEX if not exists index_com_adr ON adresse.point_adresse(id_commune);
CREATE INDEX if not exists index_parcelle_adr ON adresse.point_adresse(id_parcelle);
CREATE INDEX if not exists index_com_voie ON adresse.appartenir_com(id_com);
CREATE INDEX if not exists index_voie_com ON adresse.appartenir_com(id_voie);
CREATE INDEX if not exists index_com_comdel ON adresse.referencer_com(id_com);
CREATE INDEX if not exists index_comdel_com ON adresse.referencer_com(id_com_deleguee);

CREATE OR REPLACE FUNCTION adresse.update_full_name()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    IF NEW.typologie != OLD.typologie OR NEW.nom != OLD.nom THEN
        NEW.nom_complet:= CONCAT(NEW.typologie, ' ', NEW.nom);
    END IF;

    RETURN NEW;
END;
$BODY$;

DROP TRIGGER trigger_update_name ON adresse.voie;
CREATE TRIGGER trigger_update_name
    BEFORE UPDATE
    ON adresse.voie
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.update_full_name();


CREATE OR REPLACE FUNCTION adresse.update_adr_complete()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    IF NEW.typologie != OLD.typologie OR NEW.nom != OLD.nom THEN
        UPDATE adresse.point_adresse
        SET adresse_complete = CONCAT(numero, ' ', NEW.typologie, ' ', NEW.nom)
        WHERE id_voie = OLD.id_voie;
    END IF;

    RETURN NULL;
END;
$BODY$;

DROP TRIGGER trigger_update_adr_complete ON adresse.voie;
CREATE TRIGGER trigger_update_adr_complete
    AFTER UPDATE
    ON adresse.voie
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.update_adr_complete();

COMMIT;
